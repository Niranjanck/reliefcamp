require "application_system_test_case"

class CenterRequestsTest < ApplicationSystemTestCase
  setup do
    @center_request = center_requests(:one)
  end

  test "visiting the index" do
    visit center_requests_url
    assert_selector "h1", text: "Center Requests"
  end

  test "creating a Center request" do
    visit center_requests_url
    click_on "New Center Request"

    fill_in "Collection centers", with: @center_request.collection_centers_id
    fill_in "Items", with: @center_request.items_id
    fill_in "Quantity", with: @center_request.quantity
    fill_in "Status", with: @center_request.status
    click_on "Create Center request"

    assert_text "Center request was successfully created"
    click_on "Back"
  end

  test "updating a Center request" do
    visit center_requests_url
    click_on "Edit", match: :first

    fill_in "Collection centers", with: @center_request.collection_centers_id
    fill_in "Items", with: @center_request.items_id
    fill_in "Quantity", with: @center_request.quantity
    fill_in "Status", with: @center_request.status
    click_on "Update Center request"

    assert_text "Center request was successfully updated"
    click_on "Back"
  end

  test "destroying a Center request" do
    visit center_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Center request was successfully destroyed"
  end
end
