require "application_system_test_case"

class GameStylesTest < ApplicationSystemTestCase
  setup do
    @game_style = game_styles(:one)
  end

  test "visiting the index" do
    visit game_styles_url
    assert_selector "h1", text: "Game Styles"
  end

  test "creating a Game style" do
    visit game_styles_url
    click_on "New Game Style"

    fill_in "Name", with: @game_style.name
    click_on "Create Game style"

    assert_text "Game style was successfully created"
    click_on "Back"
  end

  test "updating a Game style" do
    visit game_styles_url
    click_on "Edit", match: :first

    fill_in "Name", with: @game_style.name
    click_on "Update Game style"

    assert_text "Game style was successfully updated"
    click_on "Back"
  end

  test "destroying a Game style" do
    visit game_styles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game style was successfully destroyed"
  end
end
