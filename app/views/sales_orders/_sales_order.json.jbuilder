json.extract! sales_order, :id, :user_id, :client, :order_date, :delivery_date, :delivery_method_id, :delivery_cost, :discount_coupon, :ammount, :delivery_address, :status, :created_at, :updated_at
json.url sales_order_url(sales_order, format: :json)
