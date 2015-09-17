require "test_helper"

class CartsControllerTest < ActionController::TestCase
  def test_show
    get :show
    assert_response :success
  end

end
