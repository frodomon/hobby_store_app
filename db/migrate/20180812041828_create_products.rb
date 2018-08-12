class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :barcode
      t.string :sku
      t.references :category, index: true
      t.references :sub_category, index: true
      t.string :short_description
      t.text :large_description
      t.float :full_price
      t.float :presale_price
      t.float :otto_price
      t.belongs_to :game_type, index: true, foreign_key: true
      t.belongs_to :game_style, index: true, foreign_key: true
      t.belongs_to :thematic, index: true, foreign_key: true
      t.belongs_to :suggested_age, index: true, foreign_key: true
      t.string :suggested_players
      t.string :game_duration
      t.string :language
      t.string :author
      t.string :origin
      t.string :brand
      t.string :editorial
      t.float :weight
      t.float :height
      t.float :width
      t.float :length
      t.belongs_to :game_line, index: true, foreign_key: true
      t.string :video_reel_url
      t.string :video_how_to_url
      t.string :video_gameplay_url
      t.string :img_box
      t.string :img_box_content
      t.string :img_board_set
      t.string :img_board_midgame
      t.string :ranking_bgg

      t.timestamps
    end
  end
end
