class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :address
      t.string :image
      t.boolean :chain

      t.timestamps
    end
  end
end
