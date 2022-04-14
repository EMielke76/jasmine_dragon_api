require 'rails_helper'

RSpec.describe 'Create a subscritpion' do
  context 'happy path' do
    it 'creates a new subscription' do
      VCR.use_cassette('create-a-subscription') do
        user_1 = create(:user)
        user_2 = create(:user)
        expect(user_1.subscriptions.count).to eq(0)
        expect(user_2.subscriptions.count).to eq(0)

        headers = { 'CONTENT_TYPE' => 'application/json' }
          params = {
            "subscription"=> {
               "user_id"=>"#{user_1.id}",
               "tea_id"=>"5fa3fd48d5ba620017ec1c09",
               "tea_name"=>"green",
               "status"=>"active",
               "frequency"=>"weekly"
              }
            }

        post "/api/v1/subscriptions", headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(user_1.subscriptions.count).to eq(1)
        expect(user_2.subscriptions.count).to eq(0)

        expect(response).to have_http_status(201)
        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)

        data = results[:data]

        expect(data).to have_key(:id)
        expect(data[:id]).to be_a(String)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq("subscription")

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]

        expect(attributes).to have_key(:user_id)
        expect(attributes[:user_id]).to eq(user_1.id)

        expect(attributes).to have_key(:tea_id)
        expect(attributes[:tea_id]).to be_a(String)

        expect(attributes).to have_key(:tea_name)
        expect(attributes[:tea_name]).to be_a(String)

        expect(attributes).to have_key(:price)
        expect(attributes[:price]).to be_a(Integer)

        expect(attributes).to have_key(:status)
        expect(attributes[:status]).to be_a(String)

        expect(attributes).to have_key(:frequency)
        expect(attributes[:frequency]).to be_a(String)
      end
    end
  end

  context 'sad path' do
    it 'returns errors if request does not pass validations' do
      VCR.use_cassette('bad-request') do
        user_1 = create(:user)

        headers = { 'CONTENT_TYPE' => 'application/json' }
          params = {
            "subscription"=> {
               "user_id"=>"",
               "tea_id"=>"",
               "tea_name"=>"",
               "status"=>"",
               "frequency"=>""
              }
            }

        post "/api/v1/subscriptions", headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})

        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("User must exist, Tea can't be blank, and Tea name can't be blank")
      end
    end

    it 'returns errors if User does not exist' do
      VCR.use_cassette('no-user') do
        user_1 = create(:user)

        headers = { 'CONTENT_TYPE' => 'application/json' }
          params = {
            "subscription"=> {
               "user_id"=>"89",
               "tea_id"=>"5fa3fd48d5ba620017ec1c09",
               "tea_name"=>"green",
               "status"=>"active",
               "frequency"=>"weekly"
              }
            }

        post "/api/v1/subscriptions", headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})

        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("User must exist")
      end
    end
  end
end
