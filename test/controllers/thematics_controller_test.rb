require 'test_helper'

class ThematicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thematic = thematics(:one)
  end

  test "should get index" do
    get thematics_url
    assert_response :success
  end

  test "should get new" do
    get new_thematic_url
    assert_response :success
  end

  test "should create thematic" do
    assert_difference('Thematic.count') do
      post thematics_url, params: { thematic: { name: @thematic.name } }
    end

    assert_redirected_to thematic_url(Thematic.last)
  end

  test "should show thematic" do
    get thematic_url(@thematic)
    assert_response :success
  end

  test "should get edit" do
    get edit_thematic_url(@thematic)
    assert_response :success
  end

  test "should update thematic" do
    patch thematic_url(@thematic), params: { thematic: { name: @thematic.name } }
    assert_redirected_to thematic_url(@thematic)
  end

  test "should destroy thematic" do
    assert_difference('Thematic.count', -1) do
      delete thematic_url(@thematic)
    end

    assert_redirected_to thematics_url
  end
end
