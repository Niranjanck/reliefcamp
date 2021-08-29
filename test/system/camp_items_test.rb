require "application_system_test_case"

class CampItemsTest < ApplicationSystemTestCase
  setup do
    @camp_item = camp_items(:one)
  end

  test "visiting the index" do
    visit camp_items_url
    assert_selector "h1", text: "Camp Items"
  end

  test "creating a Camp item" do
    visit camp_items_url
    click_on "New Camp Item"

    fill_in "Items", with: @camp_item.items_id
    fill_in "Quantity", with: @camp_item.quantity
    fill_in "Relief camps", with: @camp_item.relief_camps_id
    click_on "Create Camp item"

    assert_text "Camp item was successfully created"
    click_on "Back"
  end

  test "updating a Camp item" do
    visit camp_items_url
    click_on "Edit", match: :first

    fill_in "Items", with: @camp_item.items_id
    fill_in "Quantity", with: @camp_item.quantity
    fill_in "Relief camps", with: @camp_item.relief_camps_id
    click_on "Update Camp item"

    assert_text "Camp item was successfully updated"
    click_on "Back"
  end

  test "destroying a Camp item" do
    visit camp_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Camp item was successfully destroyed"
  end
end
