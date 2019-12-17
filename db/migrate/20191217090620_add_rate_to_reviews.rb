class AddRateToReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :rate, :integer
    add_column :reviews, :rate, :float
  end
end
