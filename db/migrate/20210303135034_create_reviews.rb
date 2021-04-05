class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name,               null: false
      t.text :description,          null: false
      t.string :texture,            null: false
      t.string :price,              null: false


      t.timestamps
    end
  end
end
