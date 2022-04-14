require 'rails_helper'

RSpec.describe "Delte a subscription endpoint" do
  context 'happy path' do
    it 'deletes a subscription' do
      VCR.use_cassette('delete-a-sub') do
        user_1 = create(:user)
        user_2 = create(:user)

        sub_1 = create(:subscription, user: user_1)
        sub_2 = create(:subscription, user: user_1)
        sub_3 = create(:subscription, user: user_2)

        expect(user_1.subscriptions.count).to eq(2)
        expect(user_2.subscriptions.count).to eq(1)

        delete "/api/v1/subscriptions/#{sub_2.id}"

        expect(response).to have_http_status(204)

        expect(user_1.subscriptions.count).to eq(1)
        expect(user_1.subscriptions.include?(sub_2)).to eq(false)
        expect(user_2.subscriptions.count).to eq(1)
      end
    end
  end

  context 'sad path' do
    it 'does nothing if a subscription didnt exist in the first place' do
      VCR.use_cassette('sub-not-found') do
        user_1 = create(:user)
        user_2 = create(:user)

        sub_1 = create(:subscription, user: user_1)
        sub_2 = create(:subscription, user: user_1)
        sub_3 = create(:subscription, user: user_2)

        delete "/api/v1/subscriptions/500"

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
