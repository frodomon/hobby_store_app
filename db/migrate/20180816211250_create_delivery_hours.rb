class CreateDeliveryHours < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_hours do |t|
      t.string :name

      t.timestamps
    end
  end
end
