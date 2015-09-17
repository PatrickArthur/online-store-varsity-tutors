require "test_helper"

class ProductsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
