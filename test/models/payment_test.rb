require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  attr_accessor :tyler, :bob, :andrew
  setup do
    @tyler = users(:tyler)
    @bob = users(:bob)
    @andrew = users(:andrew)
  end

  test '#status updates based on transfers' do
    payment = payments(:payment_one)
    amount = payment.amount / 2.0

    assert payment.valid?
    assert_equal 'unpaid', payment.status

    transfer = payment.transfers.create!(amount: amount, transfer_method: :cash)
    assert_equal 'partially_paid', payment.status
    assert_equal amount, payment.amount_paid
    assert_equal amount, payment.amount_unpaid

    transfer_2 = payment.transfers.create!(amount: amount, transfer_method: :cash)
    assert_equal 'paid', payment.status
  end
end
