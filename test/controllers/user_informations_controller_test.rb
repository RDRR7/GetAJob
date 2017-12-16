require 'test_helper'

class UserInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_informations_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_informations_edit_url
    assert_response :success
  end

end
