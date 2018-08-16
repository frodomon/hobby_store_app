require 'test_helper'

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse = warehouses(:one)
  end

  test "should get index" do
    get warehouses_url
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_url
    assert_response :success
  end

  test "should create warehouse" do
    assert_difference('Warehouse.count') do
      post warehouses_url, params: { warehouse: { address_line1: @warehouse.address_line1, address_line2: @warehouse.address_line2, departamento: @warehouse.departamento, distrito: @warehouse.distrito, house_type: @warehouse.house_type, postal_code: @warehouse.postal_code, provincia: @warehouse.provincia, shortname: @warehouse.shortname, ubigeo_id: @warehouse.ubigeo_id } }
    end

    assert_redirected_to warehouse_url(Warehouse.last)
  end

  test "should show warehouse" do
    get warehouse_url(@warehouse)
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_url(@warehouse)
    assert_response :success
  end

  test "should update warehouse" do
    patch warehouse_url(@warehouse), params: { warehouse: { address_line1: @warehouse.address_line1, address_line2: @warehouse.address_line2, departamento: @warehouse.departamento, distrito: @warehouse.distrito, house_type: @warehouse.house_type, postal_code: @warehouse.postal_code, provincia: @warehouse.provincia, shortname: @warehouse.shortname, ubigeo_id: @warehouse.ubigeo_id } }
    assert_redirected_to warehouse_url(@warehouse)
  end

  test "should destroy warehouse" do
    assert_difference('Warehouse.count', -1) do
      delete warehouse_url(@warehouse)
    end

    assert_redirected_to warehouses_url
  end
end
