json.extract! purchase_order, :id, :supplier_id, :order_date, :delivery_date, :user_id, :ammount, :registered, :created_at, :updated_at
json.url purchase_order_url(purchase_order, format: :json)
