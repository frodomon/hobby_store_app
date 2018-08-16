class SalesOrderDetail < ApplicationRecord
  belongs_to :sales_order
  belongs_to :product
end
