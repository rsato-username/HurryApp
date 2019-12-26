class CreateOrdersDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_drinks do |t|
      t.references :order,    foreign_key: true
      t.references :drink,    foreign_key: true
      t.timestamps
    end
  end
end
