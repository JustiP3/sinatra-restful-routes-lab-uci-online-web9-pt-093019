class CreateRecipes < ActiveRecord::Migration
  def change
     create_table do |t|
      t.string :name
      t.string :ingredients
      t.integer :cook_time
    end
  end
end
