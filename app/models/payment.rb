class Payment < ActiveRecord::Base
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  has_many :transfers

  before_save :update_status
  after_touch :save

  def amount_paid
    transfers.sum(:amount)
  end

  def amount_unpaid
    amount - amount_paid
  end

private
  def update_status
    self.status = case amount_paid
    when 0
      :unpaid
    when amount
      :paid
    else
      :partially_paid
    end
  end
end
