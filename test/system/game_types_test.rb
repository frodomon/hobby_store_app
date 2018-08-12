require "application_system_test_case"

class GameTypesTest < ApplicationSystemTestCase
  setup do
    @game_type = game_types(:one)
  end

  test "visiting the index" do
    visit game_types_url
    assert_selector "h1", text: "Game Types"
  end

  test "creating a Game type" do
    visit game_types_url
    click_on "New Game Type"

    fill_in "Name", with: @game_type.name
    click_on "Create Game type"

    assert_text "Game type was successfully created"
    click_on "Back"
  end

  test "updating a Game type" do
    visit game_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @game_type.name
    click_on "Update Game type"

    assert_text "Game type was successfully updated"
    click_on "Back"
  end

  test "destroying a Game type" do
    visit game_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game type was successfully destroyed"
  end
end
