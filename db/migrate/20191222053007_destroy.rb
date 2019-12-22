class Destroy < ActiveRecord::Migration[5.2]
  def change
    drop_table :order_drinks
    drop_table :order_foods
    drop_table :order_salespeople
  end
end
