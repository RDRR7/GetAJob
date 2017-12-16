require 'test_helper'

class CompaniesInformationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get companies_information_new_url
    assert_response :success
  end

  test "should get edit" do
    get companies_information_edit_url
    assert_response :success
  end

end
