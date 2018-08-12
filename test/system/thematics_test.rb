require "application_system_test_case"

class ThematicsTest < ApplicationSystemTestCase
  setup do
    @thematic = thematics(:one)
  end

  test "visiting the index" do
    visit thematics_url
    assert_selector "h1", text: "Thematics"
  end

  test "creating a Thematic" do
    visit thematics_url
    click_on "New Thematic"

    fill_in "Name", with: @thematic.name
    click_on "Create Thematic"

    assert_text "Thematic was successfully created"
    click_on "Back"
  end

  test "updating a Thematic" do
    visit thematics_url
    click_on "Edit", match: :first

    fill_in "Name", with: @thematic.name
    click_on "Update Thematic"

    assert_text "Thematic was successfully updated"
    click_on "Back"
  end

  test "destroying a Thematic" do
    visit thematics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Thematic was successfully destroyed"
  end
end
