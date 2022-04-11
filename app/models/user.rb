class User < ApplicationRecord
  has_many :subscriptions

  validates :email, presence: true, uniqueness: true,
            :format => { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
end
