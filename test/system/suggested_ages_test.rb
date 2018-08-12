require "application_system_test_case"

class SuggestedAgesTest < ApplicationSystemTestCase
  setup do
    @suggested_age = suggested_ages(:one)
  end

  test "visiting the index" do
    visit suggested_ages_url
    assert_selector "h1", text: "Suggested Ages"
  end

  test "creating a Suggested age" do
    visit suggested_ages_url
    click_on "New Suggested Age"

    fill_in "Name", with: @suggested_age.name
    click_on "Create Suggested age"

    assert_text "Suggested age was successfully created"
    click_on "Back"
  end

  test "updating a Suggested age" do
    visit suggested_ages_url
    click_on "Edit", match: :first

    fill_in "Name", with: @suggested_age.name
    click_on "Update Suggested age"

    assert_text "Suggested age was successfully updated"
    click_on "Back"
  end

  test "destroying a Suggested age" do
    visit suggested_ages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Suggested age was successfully destroyed"
  end
end
