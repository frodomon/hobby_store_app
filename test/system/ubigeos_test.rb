require "application_system_test_case"

class UbigeosTest < ApplicationSystemTestCase
  setup do
    @ubigeo = ubigeos(:one)
  end

  test "visiting the index" do
    visit ubigeos_url
    assert_selector "h1", text: "Ubigeos"
  end

  test "creating a Ubigeo" do
    visit ubigeos_url
    click_on "New Ubigeo"

    fill_in "Name", with: @ubigeo.name
    fill_in "Parent", with: @ubigeo.parent_id
    fill_in "Ug", with: @ubigeo.ug_id
    click_on "Create Ubigeo"

    assert_text "Ubigeo was successfully created"
    click_on "Back"
  end

  test "updating a Ubigeo" do
    visit ubigeos_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ubigeo.name
    fill_in "Parent", with: @ubigeo.parent_id
    fill_in "Ug", with: @ubigeo.ug_id
    click_on "Update Ubigeo"

    assert_text "Ubigeo was successfully updated"
    click_on "Back"
  end

  test "destroying a Ubigeo" do
    visit ubigeos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ubigeo was successfully destroyed"
  end
end
