require 'rails_helper'

RSpec.describe Subscription do
  describe 'relationships' do
    it { should belong_to(:user)}
  end

  describe 'validations' do
    it { should validate_presence_of(:tea_id) }
    it { should validate_presence_of(:tea_name) }
    it { should validate_numericality_of(:price) }
    it { should define_enum_for(:status).with_values([:active, :inactive]) }
    it { should define_enum_for(:frequency).with_values([:weekly, :bi_weekly, :monthly]) }
  end

  describe 'factory_bot test' do
    it 'exists' do
      subscription = create(:subscription)

      expect(subscription.tea_id).to be_a(String)
      expect(subscription.tea_name).to be_a(String)
      expect(subscription.price).to be_a(Integer)
      expect(subscription.status).to eq("active")
      expect(subscription.frequency).to eq("weekly")
      expect(subscription.user_id).to be_a(Integer)
    end
  end
end
