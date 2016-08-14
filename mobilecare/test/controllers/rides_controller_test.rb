require 'test_helper'

class RidesControllerTest < ActionDispatch::IntegrationTest
  test "should get request" do
    get rides_request_url
    assert_response :success
  end

  test "should get cancel" do
    get rides_cancel_url
    assert_response :success
  end

  test "should get update" do
    get rides_update_url
    assert_response :success
  end

end
