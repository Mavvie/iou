class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :groups
  has_many :sent_payments, class_name: "Payment", foreign_key: :sender_id
  has_many :received_payments, class_name: "Payment", foreign_key: :receiver_id

  ratyrate_rater
  ratyrate_rateable 'Overall'

  def user_balance_with(user)
  	other_sent = self.sent_payments.where(receiver_id:user.id).sum(:amount)
  	other_rec = self.received_payments.where(sender_id:user.id).sum(:amount)
  	balance = other_rec - other_sent
  end
end
