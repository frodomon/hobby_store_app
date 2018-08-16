json.extract! supplier, :id, :name, :ruc, :address_line_1, :address_line_2, :contact, :contact_mobile, :contact_email, :active, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
