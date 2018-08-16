require "application_system_test_case"

class PurchaseOrderDetailsTest < ApplicationSystemTestCase
  setup do
    @purchase_order_detail = purchase_order_details(:one)
  end

  test "visiting the index" do
    visit purchase_order_details_url
    assert_selector "h1", text: "Purchase Order Details"
  end

  test "creating a Purchase order detail" do
    visit purchase_order_details_url
    click_on "New Purchase Order Detail"

    fill_in "Product", with: @purchase_order_detail.product_id
    fill_in "Purchase Order", with: @purchase_order_detail.purchase_order_id
    fill_in "Quantity", with: @purchase_order_detail.quantity
    fill_in "Subtotal", with: @purchase_order_detail.subtotal
    fill_in "Unit Price", with: @purchase_order_detail.unit_price
    click_on "Create Purchase order detail"

    assert_text "Purchase order detail was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order detail" do
    visit purchase_order_details_url
    click_on "Edit", match: :first

    fill_in "Product", with: @purchase_order_detail.product_id
    fill_in "Purchase Order", with: @purchase_order_detail.purchase_order_id
    fill_in "Quantity", with: @purchase_order_detail.quantity
    fill_in "Subtotal", with: @purchase_order_detail.subtotal
    fill_in "Unit Price", with: @purchase_order_detail.unit_price
    click_on "Update Purchase order detail"

    assert_text "Purchase order detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order detail" do
    visit purchase_order_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order detail was successfully destroyed"
  end
end
