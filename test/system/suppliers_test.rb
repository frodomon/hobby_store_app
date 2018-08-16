require "application_system_test_case"

class SuppliersTest < ApplicationSystemTestCase
  setup do
    @supplier = suppliers(:one)
  end

  test "visiting the index" do
    visit suppliers_url
    assert_selector "h1", text: "Suppliers"
  end

  test "creating a Supplier" do
    visit suppliers_url
    click_on "New Supplier"

    fill_in "Active", with: @supplier.active
    fill_in "Address Line 1", with: @supplier.address_line_1
    fill_in "Address Line 2", with: @supplier.address_line_2
    fill_in "Contact", with: @supplier.contact
    fill_in "Contact Email", with: @supplier.contact_email
    fill_in "Contact Mobile", with: @supplier.contact_mobile
    fill_in "Name", with: @supplier.name
    fill_in "Ruc", with: @supplier.ruc
    click_on "Create Supplier"

    assert_text "Supplier was successfully created"
    click_on "Back"
  end

  test "updating a Supplier" do
    visit suppliers_url
    click_on "Edit", match: :first

    fill_in "Active", with: @supplier.active
    fill_in "Address Line 1", with: @supplier.address_line_1
    fill_in "Address Line 2", with: @supplier.address_line_2
    fill_in "Contact", with: @supplier.contact
    fill_in "Contact Email", with: @supplier.contact_email
    fill_in "Contact Mobile", with: @supplier.contact_mobile
    fill_in "Name", with: @supplier.name
    fill_in "Ruc", with: @supplier.ruc
    click_on "Update Supplier"

    assert_text "Supplier was successfully updated"
    click_on "Back"
  end

  test "destroying a Supplier" do
    visit suppliers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Supplier was successfully destroyed"
  end
end