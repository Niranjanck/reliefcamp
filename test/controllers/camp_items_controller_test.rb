require 'test_helper'

class CampItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camp_item = camp_items(:one)
  end

  test "should get index" do
    get camp_items_url
    assert_response :success
  end

  test "should get new" do
    get new_camp_item_url
    assert_response :success
  end

  test "should create camp_item" do
    assert_difference('CampItem.count') do
      post camp_items_url, params: { camp_item: { items_id: @camp_item.items_id, quantity: @camp_item.quantity, relief_camps_id: @camp_item.relief_camps_id } }
    end

    assert_redirected_to camp_item_url(CampItem.last)
  end

  test "should show camp_item" do
    get camp_item_url(@camp_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_camp_item_url(@camp_item)
    assert_response :success
  end

  test "should update camp_item" do
    patch camp_item_url(@camp_item), params: { camp_item: { items_id: @camp_item.items_id, quantity: @camp_item.quantity, relief_camps_id: @camp_item.relief_camps_id } }
    assert_redirected_to camp_item_url(@camp_item)
  end

  test "should destroy camp_item" do
    assert_difference('CampItem.count', -1) do
      delete camp_item_url(@camp_item)
    end

    assert_redirected_to camp_items_url
  end
end
