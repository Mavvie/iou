require 'test_helper'

class TransferTest < ActiveSupport::TestCase
  attr_accessor :transfer
  setup do
    @transfer = transfers(:payment_two_transfer)
  end

  test 'is valid' do
    assert transfer.valid?
    assert_equal 29.99, transfer.amount
  end
end
