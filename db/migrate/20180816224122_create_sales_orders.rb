class CreateSalesOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_orders do |t|
      t.belongs_to :user, foreign_key: true
      t.bigint :client
      t.date :order_date
      t.date :delivery_date
      t.belongs_to :delivery_method, foreign_key: true
      t.float :delivery_cost
      t.string :discount_coupon
      t.float :ammount
      t.string :delivery_address
      t.boolean :status

      t.timestamps
    end
  end
end
