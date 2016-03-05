require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  attr_accessor :payment, :tyler, :bob
  setup do
    @payment = payments(:payment_one)
    @tyler = users(:tyler)
    @bob = users(:bob)
    sign_in tyler
  end

  test '#index lists received and sent payments' do
    get :index
    assert_response :ok
    assert_equal [payments(:payment_two)], assigns(:sent_payments).to_a
    assert_equal [payments(:payment_one)], assigns(:received_payments).to_a
  end

  test '#create can create a payment' do
    assert_difference 'Payment.count', +1 do
      post :create, payment: {
        description: "No Kappa",
        amount: 10,
        sender_id: tyler.id,
        receiver_id: bob.id
      }
    end
    payment = Payment.last
    assert_redirected_to payment
  end
end
