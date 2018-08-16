class CreateSalesOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_order_details do |t|
      t.belongs_to :sales_order, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.integer :quantity
      t.float :unit_price
      t.float :subtotal

      t.timestamps
    end
  end
end
