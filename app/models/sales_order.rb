class SalesOrder < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_method
end
