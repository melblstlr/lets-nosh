class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :meal_name
      t.string :image
      t.string :description
      t.integer :restaurant_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
