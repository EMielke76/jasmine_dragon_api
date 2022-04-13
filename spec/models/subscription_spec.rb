require 'rails_helper'

RSpec.describe Subscription do
  describe 'relationships' do
    it { should belong_to(:user)}
  end

  describe 'validations' do
    it { should validate_presence_of(:tea_id) }
    it { should validate_presence_of(:tea_name) }
    it { should define_enum_for(:status).with_values([:active, :inactive]) }
    it { should define_enum_for(:frequency).with_values([:weekly, :bi_weekly, :monthly]) }
  end

  describe 'set_price' do
    it 'sets a price based on frequency desired' do
      sub_1 = create(:subscription, frequency: 0)
      sub_2 = create(:subscription, frequency: 1)
      sub_3 = create(:subscription, frequency: 2)

      expect(sub_1.price).to eq(1000)
      expect(sub_2.price).to eq(900)
      expect(sub_3.price).to eq(700)
    end
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
