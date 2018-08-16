require "application_system_test_case"

class StoreCreditsTest < ApplicationSystemTestCase
  setup do
    @store_credit = store_credits(:one)
  end

  test "visiting the index" do
    visit store_credits_url
    assert_selector "h1", text: "Store Credits"
  end

  test "creating a Store credit" do
    visit store_credits_url
    click_on "New Store Credit"

    fill_in "Ammount", with: @store_credit.ammount
    fill_in "Credit Date", with: @store_credit.credit_date
    fill_in "Detail", with: @store_credit.detail
    fill_in "User", with: @store_credit.user_id
    click_on "Create Store credit"

    assert_text "Store credit was successfully created"
    click_on "Back"
  end

  test "updating a Store credit" do
    visit store_credits_url
    click_on "Edit", match: :first

    fill_in "Ammount", with: @store_credit.ammount
    fill_in "Credit Date", with: @store_credit.credit_date
    fill_in "Detail", with: @store_credit.detail
    fill_in "User", with: @store_credit.user_id
    click_on "Update Store credit"

    assert_text "Store credit was successfully updated"
    click_on "Back"
  end

  test "destroying a Store credit" do
    visit store_credits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store credit was successfully destroyed"
  end
end
