require 'rails_helper'

RSpec.describe TeaFacade do
  context 'class methods' do
    context '::get_all_teas' do
      it 'returns Tea data', :vcr do
        results = TeaFacade.get_all_teas

        expect(results).to be_a(Array)

        results.each do |tea|
          expect(tea).to be_a(Tea)
        end
      end
    end

    context '::get_one_tea' do
      it 'returns Tea data', :vcr do
        tea_name = "green"
        results = TeaFacade.get_one_tea(tea_name)

        expect(results).to be_a(Tea)
      end
    end
  end
end
