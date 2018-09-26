require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { ammount: @ticket.ammount, client: @ticket.client, delivery_address: @ticket.delivery_address, delivery_cost: @ticket.delivery_cost, delivery_date: @ticket.delivery_date, delivery_method_id: @ticket.delivery_method_id, discount_coupon: @ticket.discount_coupon, ticket_date: @ticket.ticket_date, ticket_number: @ticket.ticket_number, user_id: @ticket.user_id } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { ammount: @ticket.ammount, client: @ticket.client, delivery_address: @ticket.delivery_address, delivery_cost: @ticket.delivery_cost, delivery_date: @ticket.delivery_date, delivery_method_id: @ticket.delivery_method_id, discount_coupon: @ticket.discount_coupon, ticket_date: @ticket.ticket_date, ticket_number: @ticket.ticket_number, user_id: @ticket.user_id } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
