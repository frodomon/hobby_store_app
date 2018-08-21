require 'test_helper'

class DeliveryHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_hour = delivery_hours(:one)
  end

  test "should get index" do
    get delivery_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_hour_url
    assert_response :success
  end

  test "should create delivery_hour" do
    assert_difference('DeliveryHour.count') do
      post delivery_hours_url, params: { delivery_hour: { name: @delivery_hour.name } }
    end

    assert_redirected_to delivery_hour_url(DeliveryHour.last)
  end

  test "should show delivery_hour" do
    get delivery_hour_url(@delivery_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_hour_url(@delivery_hour)
    assert_response :success
  end

  test "should update delivery_hour" do
    patch delivery_hour_url(@delivery_hour), params: { delivery_hour: { name: @delivery_hour.name } }
    assert_redirected_to delivery_hour_url(@delivery_hour)
  end

  test "should destroy delivery_hour" do
    assert_difference('DeliveryHour.count', -1) do
      delete delivery_hour_url(@delivery_hour)
    end

    assert_redirected_to delivery_hours_url
  end
end
