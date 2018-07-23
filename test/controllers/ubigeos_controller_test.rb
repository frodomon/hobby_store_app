require 'test_helper'

class UbigeosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ubigeo = ubigeos(:one)
  end

  test "should get index" do
    get ubigeos_url
    assert_response :success
  end

  test "should get new" do
    get new_ubigeo_url
    assert_response :success
  end

  test "should create ubigeo" do
    assert_difference('Ubigeo.count') do
      post ubigeos_url, params: { ubigeo: { name: @ubigeo.name, parent_id: @ubigeo.parent_id, ug_id: @ubigeo.ug_id } }
    end

    assert_redirected_to ubigeo_url(Ubigeo.last)
  end

  test "should show ubigeo" do
    get ubigeo_url(@ubigeo)
    assert_response :success
  end

  test "should get edit" do
    get edit_ubigeo_url(@ubigeo)
    assert_response :success
  end

  test "should update ubigeo" do
    patch ubigeo_url(@ubigeo), params: { ubigeo: { name: @ubigeo.name, parent_id: @ubigeo.parent_id, ug_id: @ubigeo.ug_id } }
    assert_redirected_to ubigeo_url(@ubigeo)
  end

  test "should destroy ubigeo" do
    assert_difference('Ubigeo.count', -1) do
      delete ubigeo_url(@ubigeo)
    end

    assert_redirected_to ubigeos_url
  end
end
