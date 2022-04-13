class Subscription < ApplicationRecord
  before_validation :set_price

  belongs_to :user

  validates :tea_id, presence: true
  validates :tea_name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  enum status: { active: 0, inactive: 1}
  enum frequency: { weekly: 0, bi_weekly: 1, monthly: 2}

  private
  def set_price
    if frequency == "weekly"
      self.price = 1000
    elsif frequency == "bi_weekly"
      self.price = 900
    elsif frequency == "monthly"
      self.price = 700
    else
      self.price = 0
    end
  end
end
