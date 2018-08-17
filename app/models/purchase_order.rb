class PurchaseOrder < ApplicationRecord
  belongs_to :supplier
  belongs_to :user
  has_many :purchase_order_details, dependent: :destroy
  accepts_nested_attributes_for :purchase_order_details, allow_destroy: true
end
