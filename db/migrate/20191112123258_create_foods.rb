class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name,         null: false
      t.integer :price,       nill: false
      t.timestamps
    end
  end
end
