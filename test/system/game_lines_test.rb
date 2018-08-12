require "application_system_test_case"

class GameLinesTest < ApplicationSystemTestCase
  setup do
    @game_line = game_lines(:one)
  end

  test "visiting the index" do
    visit game_lines_url
    assert_selector "h1", text: "Game Lines"
  end

  test "creating a Game line" do
    visit game_lines_url
    click_on "New Game Line"

    fill_in "Name", with: @game_line.name
    click_on "Create Game line"

    assert_text "Game line was successfully created"
    click_on "Back"
  end

  test "updating a Game line" do
    visit game_lines_url
    click_on "Edit", match: :first

    fill_in "Name", with: @game_line.name
    click_on "Update Game line"

    assert_text "Game line was successfully updated"
    click_on "Back"
  end

  test "destroying a Game line" do
    visit game_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game line was successfully destroyed"
  end
end
