require "test_helper"

class AllocationTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @allocation_test = allocation_tests(:one)
  end

  test "should get index" do
    get allocation_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_allocation_test_url
    assert_response :success
  end

  test "should create allocation_test" do
    assert_difference('AllocationTest.count') do
      post allocation_tests_url, params: { allocation_test: { test_id: @allocation_test.test_id, user_id: @allocation_test.user_id } }
    end

    assert_redirected_to allocation_test_url(AllocationTest.last)
  end

  test "should show allocation_test" do
    get allocation_test_url(@allocation_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_allocation_test_url(@allocation_test)
    assert_response :success
  end

  test "should update allocation_test" do
    patch allocation_test_url(@allocation_test), params: { allocation_test: { test_id: @allocation_test.test_id, user_id: @allocation_test.user_id } }
    assert_redirected_to allocation_test_url(@allocation_test)
  end

  test "should destroy allocation_test" do
    assert_difference('AllocationTest.count', -1) do
      delete allocation_test_url(@allocation_test)
    end

    assert_redirected_to allocation_tests_url
  end
end
