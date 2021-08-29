require "application_system_test_case"

class CollectionCentersTest < ApplicationSystemTestCase
  setup do
    @collection_center = collection_centers(:one)
  end

  test "visiting the index" do
    visit collection_centers_url
    assert_selector "h1", text: "Collection Centers"
  end

  test "creating a Collection center" do
    visit collection_centers_url
    click_on "New Collection Center"

    fill_in "Adminname", with: @collection_center.adminName
    fill_in "Centername", with: @collection_center.centerName
    fill_in "Description", with: @collection_center.description
    fill_in "Locationid", with: @collection_center.locationId
    fill_in "Phone", with: @collection_center.phone
    click_on "Create Collection center"

    assert_text "Collection center was successfully created"
    click_on "Back"
  end

  test "updating a Collection center" do
    visit collection_centers_url
    click_on "Edit", match: :first

    fill_in "Adminname", with: @collection_center.adminName
    fill_in "Centername", with: @collection_center.centerName
    fill_in "Description", with: @collection_center.description
    fill_in "Locationid", with: @collection_center.locationId
    fill_in "Phone", with: @collection_center.phone
    click_on "Update Collection center"

    assert_text "Collection center was successfully updated"
    click_on "Back"
  end

  test "destroying a Collection center" do
    visit collection_centers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collection center was successfully destroyed"
  end
end
