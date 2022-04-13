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
  end
end
