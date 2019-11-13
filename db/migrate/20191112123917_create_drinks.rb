class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name,         null: false
      t.integer :price,       nill: false
      t.timestamps
    end
  end
end
