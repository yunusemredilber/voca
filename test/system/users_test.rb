require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    check "Active" if @user.active
    fill_in "Biography", with: @user.biography
    fill_in "Days", with: @user.days
    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Password digest", with: @user.password_digest
    fill_in "Purpose", with: @user.purpose
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    check "Active" if @user.active
    fill_in "Biography", with: @user.biography
    fill_in "Days", with: @user.days
    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Password digest", with: @user.password_digest
    fill_in "Purpose", with: @user.purpose
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
