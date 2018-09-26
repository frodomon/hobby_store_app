class CreateTicketDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_details do |t|
      t.belongs_to :ticket, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.integer :quantity
      t.float :unit_price
      t.float :subtotal

      t.timestamps
    end
  end
end
