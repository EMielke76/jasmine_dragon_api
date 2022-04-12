require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:subscriptions)}
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
  end

  describe 'factory_bot test' do
    it 'exists' do
      user = create(:user)

      expect(user.first_name).to be_a(String)
      expect(user.last_name).to be_a(String)
      expect(user.email).to be_a(String)
      expect(user.password_digest).to be_a(String)
      expect(user.street_address).to be_a(String)
      expect(user.city).to be_a(String)
      expect(user.state).to be_a(String)
      expect(user.zipcode).to be_a(String)
    end

    it 'can create a user and subscription' do
      user_1 = create(:user)
      user_2 = create (:user)
      subscription = create(:subscription, user: user_2)

      expect(subscription.user_id).to eq(user_2.id)
      expect(user_2.subscriptions.count).to eq(1)
      expect(user_1.subscriptions.count).to eq(0)
    end
  end
end
