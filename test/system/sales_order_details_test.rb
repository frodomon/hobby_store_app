require "application_system_test_case"

class SalesOrderDetailsTest < ApplicationSystemTestCase
  setup do
    @sales_order_detail = sales_order_details(:one)
  end

  test "visiting the index" do
    visit sales_order_details_url
    assert_selector "h1", text: "Sales Order Details"
  end

  test "creating a Sales order detail" do
    visit sales_order_details_url
    click_on "New Sales Order Detail"

    fill_in "Product", with: @sales_order_detail.product_id
    fill_in "Quantity", with: @sales_order_detail.quantity
    fill_in "Sales Order", with: @sales_order_detail.sales_order_id
    fill_in "Subtotal", with: @sales_order_detail.subtotal
    fill_in "Unit Price", with: @sales_order_detail.unit_price
    click_on "Create Sales order detail"

    assert_text "Sales order detail was successfully created"
    click_on "Back"
  end

  test "updating a Sales order detail" do
    visit sales_order_details_url
    click_on "Edit", match: :first

    fill_in "Product", with: @sales_order_detail.product_id
    fill_in "Quantity", with: @sales_order_detail.quantity
    fill_in "Sales Order", with: @sales_order_detail.sales_order_id
    fill_in "Subtotal", with: @sales_order_detail.subtotal
    fill_in "Unit Price", with: @sales_order_detail.unit_price
    click_on "Update Sales order detail"

    assert_text "Sales order detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Sales order detail" do
    visit sales_order_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sales order detail was successfully destroyed"
  end
end
