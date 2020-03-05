class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.string :diet_name
      t.string :diet_description
      t.string :website_link

      t.timestamps
    end
  end
end
