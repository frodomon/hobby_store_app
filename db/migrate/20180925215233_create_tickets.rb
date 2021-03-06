class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.bigint :client
      t.date :ticket_date
      t.string :ticket_number
      t.date :delivery_date
      t.references :delivery_hour
      t.references :delivery_method
      t.float :delivery_cost
      t.string :discount_coupon
      t.references :payment_method
      t.float :ammount
      t.string :delivery_address_line1
      t.string :delivery_address_line2

      t.timestamps
    end
  end
end