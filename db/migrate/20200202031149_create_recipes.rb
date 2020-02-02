class CreateRecipes < ActiveRecord::Migration
  def change
    def create_table |t|
      t.string :name
      t.string :ingredients
      t.integer :cook_time
    end
  end
end