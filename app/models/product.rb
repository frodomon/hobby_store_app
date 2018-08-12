class Product < ApplicationRecord
  belongs_to :category
  belongs_to :sub_category
  belongs_to :game_type
  belongs_to :game_style
  belongs_to :thematic
  belongs_to :suggested_age
  belongs_to :game_line
end
