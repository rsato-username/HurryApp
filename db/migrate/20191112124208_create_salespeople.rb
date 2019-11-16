class CreateSalespeople < ActiveRecord::Migration[5.2]
  def change
    create_table :salespeople do |t|
      t.string :name,         null: false
      t.timestamps
    end
  end
end
