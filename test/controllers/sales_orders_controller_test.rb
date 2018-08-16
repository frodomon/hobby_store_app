require 'test_helper'

class SalesOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_order = sales_orders(:one)
  end

  test "should get index" do
    get sales_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_order_url
    assert_response :success
  end

  test "should create sales_order" do
    assert_difference('SalesOrder.count') do
      post sales_orders_url, params: { sales_order: { ammount: @sales_order.ammount, client: @sales_order.client, delivery_address: @sales_order.delivery_address, delivery_cost: @sales_order.delivery_cost, delivery_date: @sales_order.delivery_date, delivery_method_id: @sales_order.delivery_method_id, discount_coupon: @sales_order.discount_coupon, order_date: @sales_order.order_date, status: @sales_order.status, user_id: @sales_order.user_id } }
    end

    assert_redirected_to sales_order_url(SalesOrder.last)
  end

  test "should show sales_order" do
    get sales_order_url(@sales_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_order_url(@sales_order)
    assert_response :success
  end

  test "should update sales_order" do
    patch sales_order_url(@sales_order), params: { sales_order: { ammount: @sales_order.ammount, client: @sales_order.client, delivery_address: @sales_order.delivery_address, delivery_cost: @sales_order.delivery_cost, delivery_date: @sales_order.delivery_date, delivery_method_id: @sales_order.delivery_method_id, discount_coupon: @sales_order.discount_coupon, order_date: @sales_order.order_date, status: @sales_order.status, user_id: @sales_order.user_id } }
    assert_redirected_to sales_order_url(@sales_order)
  end

  test "should destroy sales_order" do
    assert_difference('SalesOrder.count', -1) do
      delete sales_order_url(@sales_order)
    end

    assert_redirected_to sales_orders_url
  end
end
