class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :sent_payments, class_name: "Payment", foreign_key: :sender_id
  has_many :received_payments, class_name: "Payment", foreign_key: :receiver_id
end
