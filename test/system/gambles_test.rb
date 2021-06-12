require "application_system_test_case"

class GamblesTest < ApplicationSystemTestCase
  setup do
    @gamble = gambles(:one)
  end

  test "visiting the index" do
    visit gambles_url
    assert_selector "h1", text: "Gambles"
  end

  test "creating a Gamble" do
    visit gambles_url
    click_on "New Gamble"

    fill_in "Points", with: @gamble.points
    fill_in "User", with: @gamble.user_id
    click_on "Create Gamble"

    assert_text "Gamble was successfully created"
    click_on "Back"
  end

  test "updating a Gamble" do
    visit gambles_url
    click_on "Edit", match: :first

    fill_in "Points", with: @gamble.points
    fill_in "User", with: @gamble.user_id
    click_on "Update Gamble"

    assert_text "Gamble was successfully updated"
    click_on "Back"
  end

  test "destroying a Gamble" do
    visit gambles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gamble was successfully destroyed"
  end
end
