require 'rails_helper'

RSpec.describe TeaService do
  context 'instance methods' do
    context '#get_all_teas' do
      it 'returns tea data' do
        VCR.use_cassette('get-all-teas') do
          query = TeaService.new
          result = query.get_all_teas

          expect(result).to be_a(Array)

          result.each do |tea|
            expect(tea).to be_a(Hash)

            expect(tea).to have_key(:_id)
            expect(tea[:_id]).to be_a(String)

            expect(tea).to have_key(:name)
            expect(tea[:name]).to be_a(String)

            expect(tea).to have_key(:description)
            expect(tea[:description]).to be_a(String)

            expect(tea).to have_key(:keywords)
            expect(tea[:keywords]).to be_a(String)

            expect(tea).to have_key(:origin)
            expect(tea[:origin]).to be_a(String)

            expect(tea).to have_key(:brew_time)
            expect(tea[:brew_time]).to be_a(Integer)

            expect(tea).to have_key(:temperature)
            expect(tea[:temperature]).to be_a(Integer || Float)
          end
        end
      end
    end

    context '#get_one_tea' do
      it 'returns tea data' do
        VCR.use_cassette('get-one-tea') do
          query = TeaService.new
          tea_name = "green"
          result = query.get_one_tea(tea_name)

          expect(result).to be_a(Hash)

          expect(result).to have_key(:_id)
          expect(result[:_id]).to be_a(String)

          expect(result).to have_key(:name)
          expect(result[:name]).to be_a(String)

          expect(result).to have_key(:description)
          expect(result[:description]).to be_a(String)

          expect(result).to have_key(:keywords)
          expect(result[:keywords]).to be_a(String)

          expect(result).to have_key(:origin)
          expect(result[:origin]).to be_a(String)

          expect(result).to have_key(:brew_time)
          expect(result[:brew_time]).to be_a(Integer)

          expect(result).to have_key(:temperature)
          expect(result[:temperature]).to be_a(Integer || Float)
        end
      end
    end
  end
end
