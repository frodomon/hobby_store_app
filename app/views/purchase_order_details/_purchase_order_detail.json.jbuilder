json.extract! purchase_order_detail, :id, :purchase_order_id, :product_id, :quantity, :unit_price, :subtotal, :created_at, :updated_at
json.url purchase_order_detail_url(purchase_order_detail, format: :json)
