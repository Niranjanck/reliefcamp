require 'test_helper'

class CollectionCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection_center = collection_centers(:one)
  end

  test "should get index" do
    get collection_centers_url
    assert_response :success
  end

  test "should get new" do
    get new_collection_center_url
    assert_response :success
  end

  test "should create collection_center" do
    assert_difference('CollectionCenter.count') do
      post collection_centers_url, params: { collection_center: { adminName: @collection_center.adminName, centerName: @collection_center.centerName, description: @collection_center.description, locationId: @collection_center.locationId, phone: @collection_center.phone } }
    end

    assert_redirected_to collection_center_url(CollectionCenter.last)
  end

  test "should show collection_center" do
    get collection_center_url(@collection_center)
    assert_response :success
  end

  test "should get edit" do
    get edit_collection_center_url(@collection_center)
    assert_response :success
  end

  test "should update collection_center" do
    patch collection_center_url(@collection_center), params: { collection_center: { adminName: @collection_center.adminName, centerName: @collection_center.centerName, description: @collection_center.description, locationId: @collection_center.locationId, phone: @collection_center.phone } }
    assert_redirected_to collection_center_url(@collection_center)
  end

  test "should destroy collection_center" do
    assert_difference('CollectionCenter.count', -1) do
      delete collection_center_url(@collection_center)
    end

    assert_redirected_to collection_centers_url
  end
end
