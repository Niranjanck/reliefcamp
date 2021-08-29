require "application_system_test_case"

class ReliefcampUsersTest < ApplicationSystemTestCase
  setup do
    @reliefcamp_user = reliefcamp_users(:one)
  end

  test "visiting the index" do
    visit reliefcamp_users_url
    assert_selector "h1", text: "Reliefcamp Users"
  end

  test "creating a Reliefcamp user" do
    visit reliefcamp_users_url
    click_on "New Reliefcamp User"

    fill_in "Address", with: @reliefcamp_user.Address
    fill_in "Age", with: @reliefcamp_user.Age
    fill_in "Gender", with: @reliefcamp_user.Gender
    fill_in "Name", with: @reliefcamp_user.Name
    fill_in "Phone", with: @reliefcamp_user.Phone
    click_on "Create Reliefcamp user"

    assert_text "Reliefcamp user was successfully created"
    click_on "Back"
  end

  test "updating a Reliefcamp user" do
    visit reliefcamp_users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @reliefcamp_user.Address
    fill_in "Age", with: @reliefcamp_user.Age
    fill_in "Gender", with: @reliefcamp_user.Gender
    fill_in "Name", with: @reliefcamp_user.Name
    fill_in "Phone", with: @reliefcamp_user.Phone
    click_on "Update Reliefcamp user"

    assert_text "Reliefcamp user was successfully updated"
    click_on "Back"
  end

  test "destroying a Reliefcamp user" do
    visit reliefcamp_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reliefcamp user was successfully destroyed"
  end
end
