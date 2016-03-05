class Transfer < ActiveRecord::Base
  belongs_to :payment, touch: true
  validates :payment, :amount, :transfer_method, presence: true
  validate :no_overpay, on: :create
  validates :amount, numericality: {greater_than: 0}

private
  def no_overpay
    if payment.amount_unpaid < amount
      self.errors.add(:amount, "is too large. Cannot pay more than #{payment.amount_unpaid}")
    end
  end
end
