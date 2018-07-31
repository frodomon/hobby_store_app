class Ubigeo < ApplicationRecord
	belongs_to :address, inverse_of: :ubigeo
end
