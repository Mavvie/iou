require 'test_helper'

class BillSplittingControllerTest < ActionController::TestCase
  attr_accessor :group
  setup do
    @group = groups(:apartment_one_group)
    sign_in users(:tyler)
  end

  test '#new renders a form' do
    get :new
    assert_response :ok
  end

  test '#create splits a bill' do
    assert_difference 'Payment.count', +2 do
      post :create, amount: 75, group_id: group.id, payment: {description: "Hydro bill", due_date: 1.week.from_now}
    end

    payments = Payment.last(2)
    assert_equal users(:bob), payments[0].sender
    assert_equal users(:andrew), payments[1].sender
    payments.each do |p|
      assert_equal 25, p.amount
    end
  end
end
