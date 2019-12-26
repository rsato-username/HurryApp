class AddDrinkToOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders,    :drink,        :string
    remove_column :orders,    :salesperson,  :string
    add_reference :orders,    :drink,         foreign_key: true
    add_reference :orders,    :salesperson,   foreign_key: true
  end
end
