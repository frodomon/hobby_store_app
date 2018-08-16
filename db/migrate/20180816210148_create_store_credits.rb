class CreateStoreCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :store_credits do |t|
      t.belongs_to :user, foreign_key: true
      t.float :ammount
      t.string :detail
      t.date :credit_date

      t.timestamps
    end
  end
end
