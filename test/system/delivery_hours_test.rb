require "application_system_test_case"

class DeliveryHoursTest < ApplicationSystemTestCase
  setup do
    @delivery_hour = delivery_hours(:one)
  end

  test "visiting the index" do
    visit delivery_hours_url
    assert_selector "h1", text: "Delivery Hours"
  end

  test "creating a Delivery hour" do
    visit delivery_hours_url
    click_on "New Delivery Hour"

    fill_in "Name", with: @delivery_hour.name
    click_on "Create Delivery hour"

    assert_text "Delivery hour was successfully created"
    click_on "Back"
  end

  test "updating a Delivery hour" do
    visit delivery_hours_url
    click_on "Edit", match: :first

    fill_in "Name", with: @delivery_hour.name
    click_on "Update Delivery hour"

    assert_text "Delivery hour was successfully updated"
    click_on "Back"
  end

  test "destroying a Delivery hour" do
    visit delivery_hours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Delivery hour was successfully destroyed"
  end
end
