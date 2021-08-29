require "application_system_test_case"

class ReliefCampsTest < ApplicationSystemTestCase
  setup do
    @relief_camp = relief_camps(:one)
  end

  test "visiting the index" do
    visit relief_camps_url
    assert_selector "h1", text: "Relief Camps"
  end

  test "creating a Relief camp" do
    visit relief_camps_url
    click_on "New Relief Camp"

    fill_in "Adminname", with: @relief_camp.adminName
    fill_in "Campname", with: @relief_camp.campName
    fill_in "Description", with: @relief_camp.description
    fill_in "Locationid", with: @relief_camp.locationId
    fill_in "Phone", with: @relief_camp.phone
    click_on "Create Relief camp"

    assert_text "Relief camp was successfully created"
    click_on "Back"
  end

  test "updating a Relief camp" do
    visit relief_camps_url
    click_on "Edit", match: :first

    fill_in "Adminname", with: @relief_camp.adminName
    fill_in "Campname", with: @relief_camp.campName
    fill_in "Description", with: @relief_camp.description
    fill_in "Locationid", with: @relief_camp.locationId
    fill_in "Phone", with: @relief_camp.phone
    click_on "Update Relief camp"

    assert_text "Relief camp was successfully updated"
    click_on "Back"
  end

  test "destroying a Relief camp" do
    visit relief_camps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relief camp was successfully destroyed"
  end
end
