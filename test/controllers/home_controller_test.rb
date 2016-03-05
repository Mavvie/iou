require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "renders the homepage" do
    get :index
    assert_response :ok
  end
end
