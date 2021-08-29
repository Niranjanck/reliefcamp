require 'test_helper'

class CampRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camp_request = camp_requests(:one)
  end

  test "should get index" do
    get camp_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_camp_request_url
    assert_response :success
  end

  test "should create camp_request" do
    assert_difference('CampRequest.count') do
      post camp_requests_url, params: { camp_request: { collection_centers_id: @camp_request.collection_centers_id, items_id: @camp_request.items_id, quantity: @camp_request.quantity, relief_camps_id: @camp_request.relief_camps_id, status: @camp_request.status } }
    end

    assert_redirected_to camp_request_url(CampRequest.last)
  end

  test "should show camp_request" do
    get camp_request_url(@camp_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_camp_request_url(@camp_request)
    assert_response :success
  end

  test "should update camp_request" do
    patch camp_request_url(@camp_request), params: { camp_request: { collection_centers_id: @camp_request.collection_centers_id, items_id: @camp_request.items_id, quantity: @camp_request.quantity, relief_camps_id: @camp_request.relief_camps_id, status: @camp_request.status } }
    assert_redirected_to camp_request_url(@camp_request)
  end

  test "should destroy camp_request" do
    assert_difference('CampRequest.count', -1) do
      delete camp_request_url(@camp_request)
    end

    assert_redirected_to camp_requests_url
  end
end
