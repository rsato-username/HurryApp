class AddRemoveToOrder < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :drink, foreign_key: true
  end
end
