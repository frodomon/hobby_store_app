json.extract! inventory, :id, :product_id, :quantity, :registration_date, :release_date, :warehouse_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
