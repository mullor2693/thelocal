class Meal < ApplicationRecord
  include Daytimeable

  has_many :diet_meals
  has_many :diets, through: :diet_meals
  has_many :meal_foods
  has_many :foods, -> { distinct }, through: :meal_foods
  accepts_nested_attributes_for :meal_foods

  validates :name, presence: true
  validates :name, uniqueness: true

end
