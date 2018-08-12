class CreateThematics < ActiveRecord::Migration[5.2]
  def change
    create_table :thematics do |t|
      t.string :name

      t.timestamps
    end
  end
end
