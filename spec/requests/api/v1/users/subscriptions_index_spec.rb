require 'rails_helper'

RSpec.describe 'Users Subscription index' do
  context 'happy path' do
    it 'returns all subscriptions, inactive and active' do
      VCR.use_cassette('all-subscriptions') do
        user_1 = create(:user)

        sub_1 = create(:subscription, user: user_1, status: "inactive")
        sub_2 = create(:subscription, user: user_1)
        sub_3 = create(:subscription, user: user_1, status: "inactive")
        sub_4 = create(:subscription, user: user_1)
        sub_5 = create(:subscription, user: user_1, status: "inactive")

        get "/api/v1/users/#{user_1.id}/subscriptions"

        results = JSON.parse(response.body, symbolize_names: true)
        
        expect(response).to have_http_status(200)
        expect(results).to be_a(Array)
        expect(results.count).to eq(5)

        results.each do |subscription|
          expect(subscription).to have_key(:id)
          expect(subscription[:id]).to be_a(Integer)
          expect(subscription).to have_key(:user_id)
          expect(subscription[:user_id]).to be_a(Integer)

          expect(subscription).to have_key(:tea_id)
          expect(subscription[:tea_id]).to be_a(String)

          expect(subscription).to have_key(:tea_name)
          expect(subscription[:tea_name]).to be_a(String)

          expect(subscription).to have_key(:price)
          expect(subscription[:price]).to be_a(Integer)

          expect(subscription).to have_key(:status)
          expect(subscription[:status]).to be_a(String)

          expect(subscription).to have_key(:frequency)
          expect(subscription[:frequency]).to be_a(String)
        end
      end
    end
  end
end
