class FoodNutrient < ApplicationRecord
  belongs_to :food
  belongs_to :nutrient

  scope :by_component_group, -> (group_id) { joins(:nutrient).where(:nutrients => {:component_group => group_id}) }

end
