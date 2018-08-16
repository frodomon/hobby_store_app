json.extract! warehouse, :id, :shortname, :house_type, :address_line1, :address_line2, :departamento, :provincia, :distrito, :ubigeo_id, :postal_code, :created_at, :updated_at
json.url warehouse_url(warehouse, format: :json)
