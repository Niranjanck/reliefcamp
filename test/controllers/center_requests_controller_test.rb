require 'test_helper'

class CenterRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @center_request = center_requests(:one)
  end

  test "should get index" do
    get center_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_center_request_url
    assert_response :success
  end

  test "should create center_request" do
    assert_difference('CenterRequest.count') do
      post center_requests_url, params: { center_request: { collection_centers_id: @center_request.collection_centers_id, items_id: @center_request.items_id, quantity: @center_request.quantity, status: @center_request.status } }
    end

    assert_redirected_to center_request_url(CenterRequest.last)
  end

  test "should show center_request" do
    get center_request_url(@center_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_center_request_url(@center_request)
    assert_response :success
  end

  test "should update center_request" do
    patch center_request_url(@center_request), params: { center_request: { collection_centers_id: @center_request.collection_centers_id, items_id: @center_request.items_id, quantity: @center_request.quantity, status: @center_request.status } }
    assert_redirected_to center_request_url(@center_request)
  end

  test "should destroy center_request" do
    assert_difference('CenterRequest.count', -1) do
      delete center_request_url(@center_request)
    end

    assert_redirected_to center_requests_url
  end
end
