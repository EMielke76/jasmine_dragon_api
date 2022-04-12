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
  end
end
