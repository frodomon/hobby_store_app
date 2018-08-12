class CreateGameStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :game_styles do |t|
      t.string :name

      t.timestamps
    end
  end
end
