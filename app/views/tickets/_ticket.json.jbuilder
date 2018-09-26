json.extract! ticket, :id, :user_id, :client, :ticket_date, :ticket_number, :delivery_date, :delivery_method_id, :delivery_cost, :discount_coupon, :ammount, :delivery_address, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
