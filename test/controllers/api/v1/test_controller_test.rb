require 'test_helper'

class Api::V1::TestControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_test_create_url
    assert_response :success
  end

end
