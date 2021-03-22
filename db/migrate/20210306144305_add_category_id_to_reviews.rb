class AddCategoryIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :category, foreign_key: true
  end
end
