require "application_system_test_case"

class DoiTypesTest < ApplicationSystemTestCase
  setup do
    @doi_type = doi_types(:one)
  end

  test "visiting the index" do
    visit doi_types_url
    assert_selector "h1", text: "Doi Types"
  end

  test "creating a Doi type" do
    visit doi_types_url
    click_on "New Doi Type"

    fill_in "Name", with: @doi_type.name
    click_on "Create Doi type"

    assert_text "Doi type was successfully created"
    click_on "Back"
  end

  test "updating a Doi type" do
    visit doi_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @doi_type.name
    click_on "Update Doi type"

    assert_text "Doi type was successfully updated"
    click_on "Back"
  end

  test "destroying a Doi type" do
    visit doi_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Doi type was successfully destroyed"
  end
end
