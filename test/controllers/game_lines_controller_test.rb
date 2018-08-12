require 'test_helper'

class GameLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_line = game_lines(:one)
  end

  test "should get index" do
    get game_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_game_line_url
    assert_response :success
  end

  test "should create game_line" do
    assert_difference('GameLine.count') do
      post game_lines_url, params: { game_line: { name: @game_line.name } }
    end

    assert_redirected_to game_line_url(GameLine.last)
  end

  test "should show game_line" do
    get game_line_url(@game_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_line_url(@game_line)
    assert_response :success
  end

  test "should update game_line" do
    patch game_line_url(@game_line), params: { game_line: { name: @game_line.name } }
    assert_redirected_to game_line_url(@game_line)
  end

  test "should destroy game_line" do
    assert_difference('GameLine.count', -1) do
      delete game_line_url(@game_line)
    end

    assert_redirected_to game_lines_url
  end
end
