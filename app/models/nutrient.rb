class Nutrient < ApplicationRecord
    has_many :food_nutrients
    has_many :foods, -> { distinct }, through: :food_nutrients
end
