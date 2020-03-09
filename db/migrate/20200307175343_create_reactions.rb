class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.string :reaction
      t.integer :meal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
