class CreatePurchaseOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_order_details do |t|
      t.belongs_to :purchase_order, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.integer :quantity
      t.float :unit_price
      t.float :subtotal

      t.timestamps
    end
  end
end
