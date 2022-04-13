require 'rails_helper'

RSpec.describe 'Teas Index endpoint' do
  context 'happy path' do
    it 'returns all tea data' do
      VCR.use_cassette('get-all-teas') do

        get "/api/v1/teas"

        results = JSON.parse(response.body, symbolize_names: true)
        
        expect(response).to have_http_status(200)
        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Array)
        expect(results[:data].first).to be_a(Hash)

        data = results[:data]

        data.each do |tea|
          expect(tea).to be_a(Hash)
          expect(tea).to have_key(:id)
          expect(tea[:id]).to be_a(String)

          expect(tea).to have_key(:type)
          expect(tea[:type]).to be_a(String)

          expect(tea).to have_key(:attributes)
          expect(tea[:attributes]).to be_a(Hash)

          attributes = tea[:attributes]

          expect(attributes).to have_key(:name)
          expect(attributes[:name]).to be_a(String)

          expect(attributes).to have_key(:description)
          expect(attributes[:description]).to be_a(String)

          expect(attributes).to have_key(:keywords)
          expect(attributes[:keywords]).to be_a(String)

          expect(attributes).to have_key(:origin)
          expect(attributes[:origin]).to be_a(String)

          expect(attributes).to have_key(:brew_time)
          expect(attributes[:brew_time]).to be_a(Integer || Float)

          expect(attributes).to have_key(:temperature)
          expect(attributes[:temperature]).to be_a(Integer || Float)
        end
      end
    end
  end
end
