require 'rails_helper'

RSpec.describe "Update a subscription" do
  context 'happy path' do
    it 'updates status' do
      VCR.use_cassette('update-status') do
        user_1 = create(:user)

        sub_1 = create(:subscription, user: user_1)
        sub_2 = create(:subscription, user: user_1)

        expect(Subscription.find(sub_1.id).status).to eq("active")
        expect(Subscription.find(sub_2.id).status).to eq("active")

        headers = { 'CONTENT_TYPE' => 'application/json' }
          params = ({status: "inactive"})

        patch "/api/v1/users/#{user_1.id}/subscriptions/#{sub_1.id}", headers: headers, params: JSON.generate(params)

        expect(response).to have_http_status(200)

        expect(Subscription.find(sub_1.id).status).to eq("inactive")
        expect(Subscription.find(sub_2.id).status).to eq("active")
      end
    end

    it 'updates frequency' do
      VCR.use_cassette('update-frequency') do
        user_1 = create(:user)

        sub_1 = create(:subscription, user: user_1)
        sub_2 = create(:subscription, user: user_1, frequency: "bi_weekly")

        expect(Subscription.find(sub_1.id).frequency).to eq("weekly")
        expect(Subscription.find(sub_2.id).frequency).to eq("bi_weekly")

        headers = { 'CONTENT_TYPE' => 'application/json' }
          params = ({frequency: "monthly"})

        patch "/api/v1/users/#{user_1.id}/subscriptions/#{sub_1.id}", headers: headers, params: JSON.generate(params)

        expect(response).to have_http_status(200)

        expect(Subscription.find(sub_1.id).frequency).to eq("monthly")
        expect(Subscription.find(sub_2.id).frequency).to eq("bi_weekly")
      end
    end

    it 'updates pricing dynamically', :vcr do
      user_1 = create(:user)

      sub_1 = create(:subscription, user: user_1)
      sub_2 = create(:subscription, user: user_1, frequency: "bi_weekly")

      expect(Subscription.find(sub_1.id).price).to eq(1000)
      expect(Subscription.find(sub_2.id).price).to eq(900)

      headers = { 'CONTENT_TYPE' => 'application/json' }
        params = ({frequency: "monthly"})

      patch "/api/v1/users/#{user_1.id}/subscriptions/#{sub_1.id}", headers: headers, params: JSON.generate(params)

      expect(response).to have_http_status(200)

      expect(Subscription.find(sub_1.id).price).to eq(700)
      expect(Subscription.find(sub_2.id).price).to eq(900)
    end
  end

  context 'sad path' do
    it 'returns errors if sub doesnt exist' do
      VCR.use_cassette('user-does-not-exist') do
        user_1 = create(:user)

        sub_1 = create(:subscription, user: user_1)

        headers = { 'CONTENT_TYPE' => 'application/json' }
          params = ({status: "inactive"})

        patch "/api/v1/users/#{user_1.id}/subscriptions/500", headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(404)
        expect(results).to be_a(Hash)

        expect(results).to have_key(:status)
        expect(results[:status]).to eq(404)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Subscription Not Found")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end
  end
end
