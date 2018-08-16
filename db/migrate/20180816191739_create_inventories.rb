class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.belongs_to :product, foreign_key: true
      t.bigint :quantity
      t.date :registration_date
      t.date :release_date
      t.belongs_to :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
