class Payment < ActiveRecord::Base
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  has_many :transfers

  validates :sender, :receiver, :amount, :description, :due_date, presence: true
  validate :not_sending_to_self

  scope :unpaid, -> { where.not(status: 'paid') }
  scope :paid, -> { where(status: 'paid') }

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

  def not_sending_to_self
    if sender == receiver
      self.errors.add(:receiver, 'cannot send to self')
    end
  end
end
