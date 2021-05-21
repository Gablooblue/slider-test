require "application_system_test_case"

class AllocationTestsTest < ApplicationSystemTestCase
  setup do
    @allocation_test = allocation_tests(:one)
  end

  test "visiting the index" do
    visit allocation_tests_url
    assert_selector "h1", text: "Allocation Tests"
  end

  test "creating a Allocation test" do
    visit allocation_tests_url
    click_on "New Allocation Test"

    fill_in "Test", with: @allocation_test.test_id
    fill_in "User", with: @allocation_test.user_id
    click_on "Create Allocation test"

    assert_text "Allocation test was successfully created"
    click_on "Back"
  end

  test "updating a Allocation test" do
    visit allocation_tests_url
    click_on "Edit", match: :first

    fill_in "Test", with: @allocation_test.test_id
    fill_in "User", with: @allocation_test.user_id
    click_on "Update Allocation test"

    assert_text "Allocation test was successfully updated"
    click_on "Back"
  end

  test "destroying a Allocation test" do
    visit allocation_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Allocation test was successfully destroyed"
  end
end
