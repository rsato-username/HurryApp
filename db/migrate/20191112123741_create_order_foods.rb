class CreateOrderFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :order_foods do |t|
      t.references :order,      foreign_key: true
      t.references :food,       foreign_key: true
      t.timestamps
    end
  end
end
