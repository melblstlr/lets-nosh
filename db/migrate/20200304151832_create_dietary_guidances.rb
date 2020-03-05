class CreateDietaryGuidances < ActiveRecord::Migration[6.0]
  def change
    create_table :dietary_guidances do |t|
      t.integer :meal_id
      t.integer :diet_id

      t.timestamps
    end
  end
end
