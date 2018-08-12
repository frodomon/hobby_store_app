class CreateSuggestedAges < ActiveRecord::Migration[5.2]
  def change
    create_table :suggested_ages do |t|
      t.string :name

      t.timestamps
    end
  end
end
