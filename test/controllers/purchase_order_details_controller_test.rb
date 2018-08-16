require 'test_helper'

class PurchaseOrderDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_order_detail = purchase_order_details(:one)
  end

  test "should get index" do
    get purchase_order_details_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_order_detail_url
    assert_response :success
  end

  test "should create purchase_order_detail" do
    assert_difference('PurchaseOrderDetail.count') do
      post purchase_order_details_url, params: { purchase_order_detail: { product_id: @purchase_order_detail.product_id, purchase_order_id: @purchase_order_detail.purchase_order_id, quantity: @purchase_order_detail.quantity, subtotal: @purchase_order_detail.subtotal, unit_price: @purchase_order_detail.unit_price } }
    end

    assert_redirected_to purchase_order_detail_url(PurchaseOrderDetail.last)
  end

  test "should show purchase_order_detail" do
    get purchase_order_detail_url(@purchase_order_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_order_detail_url(@purchase_order_detail)
    assert_response :success
  end

  test "should update purchase_order_detail" do
    patch purchase_order_detail_url(@purchase_order_detail), params: { purchase_order_detail: { product_id: @purchase_order_detail.product_id, purchase_order_id: @purchase_order_detail.purchase_order_id, quantity: @purchase_order_detail.quantity, subtotal: @purchase_order_detail.subtotal, unit_price: @purchase_order_detail.unit_price } }
    assert_redirected_to purchase_order_detail_url(@purchase_order_detail)
  end

  test "should destroy purchase_order_detail" do
    assert_difference('PurchaseOrderDetail.count', -1) do
      delete purchase_order_detail_url(@purchase_order_detail)
    end

    assert_redirected_to purchase_order_details_url
  end
end
