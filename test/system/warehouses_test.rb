require "application_system_test_case"

class WarehousesTest < ApplicationSystemTestCase
  setup do
    @warehouse = warehouses(:one)
  end

  test "visiting the index" do
    visit warehouses_url
    assert_selector "h1", text: "Warehouses"
  end

  test "creating a Warehouse" do
    visit warehouses_url
    click_on "New Warehouse"

    fill_in "Address Line1", with: @warehouse.address_line1
    fill_in "Address Line2", with: @warehouse.address_line2
    fill_in "Departamento", with: @warehouse.departamento
    fill_in "Distrito", with: @warehouse.distrito
    fill_in "House Type", with: @warehouse.house_type
    fill_in "Postal Code", with: @warehouse.postal_code
    fill_in "Provincia", with: @warehouse.provincia
    fill_in "Shortname", with: @warehouse.shortname
    fill_in "Ubigeo", with: @warehouse.ubigeo_id
    click_on "Create Warehouse"

    assert_text "Warehouse was successfully created"
    click_on "Back"
  end

  test "updating a Warehouse" do
    visit warehouses_url
    click_on "Edit", match: :first

    fill_in "Address Line1", with: @warehouse.address_line1
    fill_in "Address Line2", with: @warehouse.address_line2
    fill_in "Departamento", with: @warehouse.departamento
    fill_in "Distrito", with: @warehouse.distrito
    fill_in "House Type", with: @warehouse.house_type
    fill_in "Postal Code", with: @warehouse.postal_code
    fill_in "Provincia", with: @warehouse.provincia
    fill_in "Shortname", with: @warehouse.shortname
    fill_in "Ubigeo", with: @warehouse.ubigeo_id
    click_on "Update Warehouse"

    assert_text "Warehouse was successfully updated"
    click_on "Back"
  end

  test "destroying a Warehouse" do
    visit warehouses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warehouse was successfully destroyed"
  end
end
