class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :ruc
      t.string :address_line_1
      t.string :address_line_2
      t.string :contact
      t.string :contact_mobile
      t.string :contact_email
      t.boolean :active

      t.timestamps
    end
  end
end
