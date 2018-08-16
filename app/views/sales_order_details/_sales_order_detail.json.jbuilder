json.extract! sales_order_detail, :id, :sales_order_id, :product_id, :quantity, :unit_price, :subtotal, :created_at, :updated_at
json.url sales_order_detail_url(sales_order_detail, format: :json)
