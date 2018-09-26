require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "creating a Ticket" do
    visit tickets_url
    click_on "New Ticket"

    fill_in "Ammount", with: @ticket.ammount
    fill_in "Client", with: @ticket.client
    fill_in "Delivery Address", with: @ticket.delivery_address
    fill_in "Delivery Cost", with: @ticket.delivery_cost
    fill_in "Delivery Date", with: @ticket.delivery_date
    fill_in "Delivery Method", with: @ticket.delivery_method_id
    fill_in "Discount Coupon", with: @ticket.discount_coupon
    fill_in "Ticket Date", with: @ticket.ticket_date
    fill_in "Ticket Number", with: @ticket.ticket_number
    fill_in "User", with: @ticket.user_id
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    visit tickets_url
    click_on "Edit", match: :first

    fill_in "Ammount", with: @ticket.ammount
    fill_in "Client", with: @ticket.client
    fill_in "Delivery Address", with: @ticket.delivery_address
    fill_in "Delivery Cost", with: @ticket.delivery_cost
    fill_in "Delivery Date", with: @ticket.delivery_date
    fill_in "Delivery Method", with: @ticket.delivery_method_id
    fill_in "Discount Coupon", with: @ticket.discount_coupon
    fill_in "Ticket Date", with: @ticket.ticket_date
    fill_in "Ticket Number", with: @ticket.ticket_number
    fill_in "User", with: @ticket.user_id
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
