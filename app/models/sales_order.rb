class SalesOrder < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_method
  has_many :sales_order_details, dependent: :destroy
  accepts_nested_attributes_for :sales_order_details, allow_destroy: true
end
