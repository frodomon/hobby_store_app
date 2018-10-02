class GameType < ApplicationRecord
	has_one :product

	validates_presence_of :name
end
