class CreateFoodNutrients < ActiveRecord::Migration[6.0]
  def change
    create_table :food_nutrients do |t|
      t.belongs_to :food, null: false, foreign_key: true
      t.belongs_to :nutrient, null: false, foreign_key: true
      t.decimal :quantity
      t.string :unit
      
      t.timestamps
    end
  end
end
