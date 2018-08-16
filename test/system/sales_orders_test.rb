require "application_system_test_case"

class SalesOrdersTest < ApplicationSystemTestCase
  setup do
    @sales_order = sales_orders(:one)
  end

  test "visiting the index" do
    visit sales_orders_url
    assert_selector "h1", text: "Sales Orders"
  end

  test "creating a Sales order" do
    visit sales_orders_url
    click_on "New Sales Order"

    fill_in "Ammount", with: @sales_order.ammount
    fill_in "Client", with: @sales_order.client
    fill_in "Delivery Address", with: @sales_order.delivery_address
    fill_in "Delivery Cost", with: @sales_order.delivery_cost
    fill_in "Delivery Date", with: @sales_order.delivery_date
    fill_in "Delivery Method", with: @sales_order.delivery_method_id
    fill_in "Discount Coupon", with: @sales_order.discount_coupon
    fill_in "Order Date", with: @sales_order.order_date
    fill_in "Status", with: @sales_order.status
    fill_in "User", with: @sales_order.user_id
    click_on "Create Sales order"

    assert_text "Sales order was successfully created"
    click_on "Back"
  end

  test "updating a Sales order" do
    visit sales_orders_url
    click_on "Edit", match: :first

    fill_in "Ammount", with: @sales_order.ammount
    fill_in "Client", with: @sales_order.client
    fill_in "Delivery Address", with: @sales_order.delivery_address
    fill_in "Delivery Cost", with: @sales_order.delivery_cost
    fill_in "Delivery Date", with: @sales_order.delivery_date
    fill_in "Delivery Method", with: @sales_order.delivery_method_id
    fill_in "Discount Coupon", with: @sales_order.discount_coupon
    fill_in "Order Date", with: @sales_order.order_date
    fill_in "Status", with: @sales_order.status
    fill_in "User", with: @sales_order.user_id
    click_on "Update Sales order"

    assert_text "Sales order was successfully updated"
    click_on "Back"
  end

  test "destroying a Sales order" do
    visit sales_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sales order was successfully destroyed"
  end
end
