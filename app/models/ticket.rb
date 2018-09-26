class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_method
  belongs_to :delivery_hour
  belongs_to :payment_method
  has_many :ticket_details, dependent: :destroy
  accepts_nested_attributes_for :ticket_details, allow_destroy: true
end
