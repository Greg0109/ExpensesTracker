require "test_helper"

class TypesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get types_new_url
    assert_response :success
  end
end
