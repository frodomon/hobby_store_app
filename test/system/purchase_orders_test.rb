require "application_system_test_case"

class PurchaseOrdersTest < ApplicationSystemTestCase
  setup do
    @purchase_order = purchase_orders(:one)
  end

  test "visiting the index" do
    visit purchase_orders_url
    assert_selector "h1", text: "Purchase Orders"
  end

  test "creating a Purchase order" do
    visit purchase_orders_url
    click_on "New Purchase Order"

    fill_in "Ammount", with: @purchase_order.ammount
    fill_in "Delivery Date", with: @purchase_order.delivery_date
    fill_in "Order Date", with: @purchase_order.order_date
    fill_in "Registered", with: @purchase_order.registered
    fill_in "Supplier", with: @purchase_order.supplier_id
    fill_in "User", with: @purchase_order.user_id
    click_on "Create Purchase order"

    assert_text "Purchase order was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order" do
    visit purchase_orders_url
    click_on "Edit", match: :first

    fill_in "Ammount", with: @purchase_order.ammount
    fill_in "Delivery Date", with: @purchase_order.delivery_date
    fill_in "Order Date", with: @purchase_order.order_date
    fill_in "Registered", with: @purchase_order.registered
    fill_in "Supplier", with: @purchase_order.supplier_id
    fill_in "User", with: @purchase_order.user_id
    click_on "Update Purchase order"

    assert_text "Purchase order was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order" do
    visit purchase_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order was successfully destroyed"
  end
end
