require "application_system_test_case"

class CampRequestsTest < ApplicationSystemTestCase
  setup do
    @camp_request = camp_requests(:one)
  end

  test "visiting the index" do
    visit camp_requests_url
    assert_selector "h1", text: "Camp Requests"
  end

  test "creating a Camp request" do
    visit camp_requests_url
    click_on "New Camp Request"

    fill_in "Collection centers", with: @camp_request.collection_centers_id
    fill_in "Items", with: @camp_request.items_id
    fill_in "Quantity", with: @camp_request.quantity
    fill_in "Relief camps", with: @camp_request.relief_camps_id
    fill_in "Status", with: @camp_request.status
    click_on "Create Camp request"

    assert_text "Camp request was successfully created"
    click_on "Back"
  end

  test "updating a Camp request" do
    visit camp_requests_url
    click_on "Edit", match: :first

    fill_in "Collection centers", with: @camp_request.collection_centers_id
    fill_in "Items", with: @camp_request.items_id
    fill_in "Quantity", with: @camp_request.quantity
    fill_in "Relief camps", with: @camp_request.relief_camps_id
    fill_in "Status", with: @camp_request.status
    click_on "Update Camp request"

    assert_text "Camp request was successfully updated"
    click_on "Back"
  end

  test "destroying a Camp request" do
    visit camp_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Camp request was successfully destroyed"
  end
end
