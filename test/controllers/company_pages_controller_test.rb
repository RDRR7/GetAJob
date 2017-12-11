require 'test_helper'

class CompanyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get company_pages_homepage_url
    assert_response :success
  end

  test "should get home" do
    get company_pages_home_url
    assert_response :success
  end

end
