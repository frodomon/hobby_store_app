class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.references :product, foreign_key: true
      t.bigint :quantity
      t.date :registration_date
      t.date :release_date
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
