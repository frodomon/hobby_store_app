class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :shortname
      t.string :house_type
      t.string :address_line1
      t.string :address_line2
      t.string :departamento
      t.string :provincia
      t.string :distrito
      t.references :ubigeo
      t.string :postal_code

      t.timestamps
    end
  end
end
