class CreateGameLines < ActiveRecord::Migration[5.2]
  def change
    create_table :game_lines do |t|
      t.string :name

      t.timestamps
    end
  end
end
