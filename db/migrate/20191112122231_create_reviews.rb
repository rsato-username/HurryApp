class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :text
      t.integer :rate,          null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
