require 'test_helper'

class ReliefCampsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relief_camp = relief_camps(:one)
  end

  test "should get index" do
    get relief_camps_url
    assert_response :success
  end

  test "should get new" do
    get new_relief_camp_url
    assert_response :success
  end

  test "should create relief_camp" do
    assert_difference('ReliefCamp.count') do
      post relief_camps_url, params: { relief_camp: { adminName: @relief_camp.adminName, campName: @relief_camp.campName, description: @relief_camp.description, locationId: @relief_camp.locationId, phone: @relief_camp.phone } }
    end

    assert_redirected_to relief_camp_url(ReliefCamp.last)
  end

  test "should show relief_camp" do
    get relief_camp_url(@relief_camp)
    assert_response :success
  end

  test "should get edit" do
    get edit_relief_camp_url(@relief_camp)
    assert_response :success
  end

  test "should update relief_camp" do
    patch relief_camp_url(@relief_camp), params: { relief_camp: { adminName: @relief_camp.adminName, campName: @relief_camp.campName, description: @relief_camp.description, locationId: @relief_camp.locationId, phone: @relief_camp.phone } }
    assert_redirected_to relief_camp_url(@relief_camp)
  end

  test "should destroy relief_camp" do
    assert_difference('ReliefCamp.count', -1) do
      delete relief_camp_url(@relief_camp)
    end

    assert_redirected_to relief_camps_url
  end
end
