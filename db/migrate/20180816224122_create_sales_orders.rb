class CreateSalesOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_orders do |t|
      t.references :user, foreign_key: true
      t.bigint :client
      t.string :order_number
      t.date :order_date
      t.date :delivery_date
      t.references :delivery_hour, foreign_key: true
      t.references :delivery_method, foreign_key: true
      t.float :delivery_cost
      t.string :discount_coupon
      t.float :ammount
      t.string :delivery_address_line1
      t.string :delivery_address_line2
      t.references :payment_method, foreign_key:true
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
