class CreateUbigeos < ActiveRecord::Migration[5.2]
  def change
    create_table :ubigeos do |t|
      t.integer :ug_id
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
