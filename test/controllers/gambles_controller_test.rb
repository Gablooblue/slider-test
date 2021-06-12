require "test_helper"

class GamblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamble = gambles(:one)
  end

  test "should get index" do
    get gambles_url
    assert_response :success
  end

  test "should get new" do
    get new_gamble_url
    assert_response :success
  end

  test "should create gamble" do
    assert_difference('Gamble.count') do
      post gambles_url, params: { gamble: { points: @gamble.points, user_id: @gamble.user_id } }
    end

    assert_redirected_to gamble_url(Gamble.last)
  end

  test "should show gamble" do
    get gamble_url(@gamble)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamble_url(@gamble)
    assert_response :success
  end

  test "should update gamble" do
    patch gamble_url(@gamble), params: { gamble: { points: @gamble.points, user_id: @gamble.user_id } }
    assert_redirected_to gamble_url(@gamble)
  end

  test "should destroy gamble" do
    assert_difference('Gamble.count', -1) do
      delete gamble_url(@gamble)
    end

    assert_redirected_to gambles_url
  end
end
