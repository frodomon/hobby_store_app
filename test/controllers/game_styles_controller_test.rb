require 'test_helper'

class GameStylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_style = game_styles(:one)
  end

  test "should get index" do
    get game_styles_url
    assert_response :success
  end

  test "should get new" do
    get new_game_style_url
    assert_response :success
  end

  test "should create game_style" do
    assert_difference('GameStyle.count') do
      post game_styles_url, params: { game_style: { name: @game_style.name } }
    end

    assert_redirected_to game_style_url(GameStyle.last)
  end

  test "should show game_style" do
    get game_style_url(@game_style)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_style_url(@game_style)
    assert_response :success
  end

  test "should update game_style" do
    patch game_style_url(@game_style), params: { game_style: { name: @game_style.name } }
    assert_redirected_to game_style_url(@game_style)
  end

  test "should destroy game_style" do
    assert_difference('GameStyle.count', -1) do
      delete game_style_url(@game_style)
    end

    assert_redirected_to game_styles_url
  end
end
