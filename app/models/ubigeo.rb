class Ubigeo < ApplicationRecord
	has_one :address, inverse_of: :ubigeo
	has_one :warehouse, inverse_of: :ubigeo
end
