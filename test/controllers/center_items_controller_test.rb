require 'test_helper'

class CenterItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @center_item = center_items(:one)
  end

  test "should get index" do
    get center_items_url
    assert_response :success
  end

  test "should get new" do
    get new_center_item_url
    assert_response :success
  end

  test "should create center_item" do
    assert_difference('CenterItem.count') do
      post center_items_url, params: { center_item: { collection_centers_id: @center_item.collection_centers_id, items_id: @center_item.items_id, quantity: @center_item.quantity } }
    end

    assert_redirected_to center_item_url(CenterItem.last)
  end

  test "should show center_item" do
    get center_item_url(@center_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_center_item_url(@center_item)
    assert_response :success
  end

  test "should update center_item" do
    patch center_item_url(@center_item), params: { center_item: { collection_centers_id: @center_item.collection_centers_id, items_id: @center_item.items_id, quantity: @center_item.quantity } }
    assert_redirected_to center_item_url(@center_item)
  end

  test "should destroy center_item" do
    assert_difference('CenterItem.count', -1) do
      delete center_item_url(@center_item)
    end

    assert_redirected_to center_items_url
  end
end
