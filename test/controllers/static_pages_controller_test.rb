require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  setup do
    @static_page = static_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_pages)
  end
end
