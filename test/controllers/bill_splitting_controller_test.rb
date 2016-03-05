require 'test_helper'

class BillSplittingControllerTest < ActionController::TestCase
  attr_accessor :group
  setup do
    @group = groups(:apartment_one_group)
    sign_in tyler
  end

  test '#create splits a bill' do
    
  end
end
