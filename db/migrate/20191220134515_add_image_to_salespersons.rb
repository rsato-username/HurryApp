class AddImageToSalespersons < ActiveRecord::Migration[5.2]
  def change
    add_column :salespeople, :image, :string
  end
end
