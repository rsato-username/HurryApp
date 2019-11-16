class CreateOrderSalespeople < ActiveRecord::Migration[5.2]
  def change
    create_table :order_salespeople do |t|
      t.references :order,             foreign_key: true
      t.references :salesperson,       foreign_key: true
      t.timestamps
    end
  end
end
