class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :seat,           null: false
      t.string :food,           null: false, unique: true, default: ""
      t.string :drink,          null: false
      t.string :salesperson,    null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
