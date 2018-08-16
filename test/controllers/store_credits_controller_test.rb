require 'test_helper'

class StoreCreditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_credit = store_credits(:one)
  end

  test "should get index" do
    get store_credits_url
    assert_response :success
  end

  test "should get new" do
    get new_store_credit_url
    assert_response :success
  end

  test "should create store_credit" do
    assert_difference('StoreCredit.count') do
      post store_credits_url, params: { store_credit: { ammount: @store_credit.ammount, credit_date: @store_credit.credit_date, detail: @store_credit.detail, user_id: @store_credit.user_id } }
    end

    assert_redirected_to store_credit_url(StoreCredit.last)
  end

  test "should show store_credit" do
    get store_credit_url(@store_credit)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_credit_url(@store_credit)
    assert_response :success
  end

  test "should update store_credit" do
    patch store_credit_url(@store_credit), params: { store_credit: { ammount: @store_credit.ammount, credit_date: @store_credit.credit_date, detail: @store_credit.detail, user_id: @store_credit.user_id } }
    assert_redirected_to store_credit_url(@store_credit)
  end

  test "should destroy store_credit" do
    assert_difference('StoreCredit.count', -1) do
      delete store_credit_url(@store_credit)
    end

    assert_redirected_to store_credits_url
  end
end
