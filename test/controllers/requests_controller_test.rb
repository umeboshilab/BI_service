require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get requests_create_url
    assert_response :success
  end

  test "should get show" do
    get requests_show_url
    assert_response :success
  end

  test "should get checkRequest" do
    get requests_checkRequest_url
    assert_response :success
  end

  test "should get report" do
    get requests_report_url
    assert_response :success
  end
end
