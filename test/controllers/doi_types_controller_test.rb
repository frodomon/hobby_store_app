require 'test_helper'

class DoiTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doi_type = doi_types(:one)
  end

  test "should get index" do
    get doi_types_url
    assert_response :success
  end

  test "should get new" do
    get new_doi_type_url
    assert_response :success
  end

  test "should create doi_type" do
    assert_difference('DoiType.count') do
      post doi_types_url, params: { doi_type: { name: @doi_type.name } }
    end

    assert_redirected_to doi_type_url(DoiType.last)
  end

  test "should show doi_type" do
    get doi_type_url(@doi_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_doi_type_url(@doi_type)
    assert_response :success
  end

  test "should update doi_type" do
    patch doi_type_url(@doi_type), params: { doi_type: { name: @doi_type.name } }
    assert_redirected_to doi_type_url(@doi_type)
  end

  test "should destroy doi_type" do
    assert_difference('DoiType.count', -1) do
      delete doi_type_url(@doi_type)
    end

    assert_redirected_to doi_types_url
  end
end
