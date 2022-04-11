require 'rails_helper'

RSpec.describe Subscription do
  describe 'relationships' do
    it { should belong_to(:user)}
  end

  describe 'validations' do
    it { should validate_presence_of(:tea_id) }
    it { should validate_numericality_of(:price) }
    it { should define_enum_for(:status).with([:active, :inactive]) }
    it { should define_enum_for(:frequency).with([:weekly, :bi_weekly, :monthly]) }
  end
end
