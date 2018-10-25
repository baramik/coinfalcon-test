require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_address" do
    get users_my_address_url
    assert_response :success
  end

end
