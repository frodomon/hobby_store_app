require 'test_helper'

class SuggestedAgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suggested_age = suggested_ages(:one)
  end

  test "should get index" do
    get suggested_ages_url
    assert_response :success
  end

  test "should get new" do
    get new_suggested_age_url
    assert_response :success
  end

  test "should create suggested_age" do
    assert_difference('SuggestedAge.count') do
      post suggested_ages_url, params: { suggested_age: { name: @suggested_age.name } }
    end

    assert_redirected_to suggested_age_url(SuggestedAge.last)
  end

  test "should show suggested_age" do
    get suggested_age_url(@suggested_age)
    assert_response :success
  end

  test "should get edit" do
    get edit_suggested_age_url(@suggested_age)
    assert_response :success
  end

  test "should update suggested_age" do
    patch suggested_age_url(@suggested_age), params: { suggested_age: { name: @suggested_age.name } }
    assert_redirected_to suggested_age_url(@suggested_age)
  end

  test "should destroy suggested_age" do
    assert_difference('SuggestedAge.count', -1) do
      delete suggested_age_url(@suggested_age)
    end

    assert_redirected_to suggested_ages_url
  end
end
