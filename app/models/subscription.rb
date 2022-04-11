class Subscription < ApplicationRecord
  belongs_to :user

  validates :tea_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  enum status: { active: 0, inactive: 1}
  enum frequency: { weekly: 0, bi_weekly: 1, monthly: 2}
end
