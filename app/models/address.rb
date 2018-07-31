class Address < ApplicationRecord
  has_one :ubigeo
  belongs_to :user, inverse_of: :address
end
