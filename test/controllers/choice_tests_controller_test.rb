require "test_helper"

class ChoiceTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @choice_test = choice_tests(:one)
  end

  test "should get index" do
    get choice_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_choice_test_url
    assert_response :success
  end

  test "should create choice_test" do
    assert_difference('ChoiceTest.count') do
      post choice_tests_url, params: { choice_test: { test_id: @choice_test.test_id, user_id: @choice_test.user_id } }
    end

    assert_redirected_to choice_test_url(ChoiceTest.last)
  end

  test "should show choice_test" do
    get choice_test_url(@choice_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_choice_test_url(@choice_test)
    assert_response :success
  end

  test "should update choice_test" do
    patch choice_test_url(@choice_test), params: { choice_test: { test_id: @choice_test.test_id, user_id: @choice_test.user_id } }
    assert_redirected_to choice_test_url(@choice_test)
  end

  test "should destroy choice_test" do
    assert_difference('ChoiceTest.count', -1) do
      delete choice_test_url(@choice_test)
    end

    assert_redirected_to choice_tests_url
  end
end
