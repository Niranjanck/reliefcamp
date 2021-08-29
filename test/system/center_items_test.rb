require "application_system_test_case"

class CenterItemsTest < ApplicationSystemTestCase
  setup do
    @center_item = center_items(:one)
  end

  test "visiting the index" do
    visit center_items_url
    assert_selector "h1", text: "Center Items"
  end

  test "creating a Center item" do
    visit center_items_url
    click_on "New Center Item"

    fill_in "Collection centers", with: @center_item.collection_centers_id
    fill_in "Items", with: @center_item.items_id
    fill_in "Quantity", with: @center_item.quantity
    click_on "Create Center item"

    assert_text "Center item was successfully created"
    click_on "Back"
  end

  test "updating a Center item" do
    visit center_items_url
    click_on "Edit", match: :first

    fill_in "Collection centers", with: @center_item.collection_centers_id
    fill_in "Items", with: @center_item.items_id
    fill_in "Quantity", with: @center_item.quantity
    click_on "Update Center item"

    assert_text "Center item was successfully updated"
    click_on "Back"
  end

  test "destroying a Center item" do
    visit center_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Center item was successfully destroyed"
  end
end
