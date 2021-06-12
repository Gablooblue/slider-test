require "application_system_test_case"

class ChoiceTestsTest < ApplicationSystemTestCase
  setup do
    @choice_test = choice_tests(:one)
  end

  test "visiting the index" do
    visit choice_tests_url
    assert_selector "h1", text: "Choice Tests"
  end

  test "creating a Choice test" do
    visit choice_tests_url
    click_on "New Choice Test"

    fill_in "Test", with: @choice_test.test_id
    fill_in "User", with: @choice_test.user_id
    click_on "Create Choice test"

    assert_text "Choice test was successfully created"
    click_on "Back"
  end

  test "updating a Choice test" do
    visit choice_tests_url
    click_on "Edit", match: :first

    fill_in "Test", with: @choice_test.test_id
    fill_in "User", with: @choice_test.user_id
    click_on "Update Choice test"

    assert_text "Choice test was successfully updated"
    click_on "Back"
  end

  test "destroying a Choice test" do
    visit choice_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Choice test was successfully destroyed"
  end
end
