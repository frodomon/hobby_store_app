class Address < ApplicationRecord
  belongs_to :ubigeo
  belongs_to :user, inverse_of: :address
end
