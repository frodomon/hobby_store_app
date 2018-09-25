class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.belongs_to :supplier, foreign_key: true
      t.string :order_number
      t.date :order_date
      t.date :delivery_date
      t.belongs_to :user, foreign_key: true
      t.float :ammount
      t.boolean :registered, default: false

      t.timestamps
    end
  end
end
