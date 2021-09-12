class MealFood < ApplicationRecord
  include ActiveModel::Conversion
  
  UNITS = ["kg", "g", "mg", "ug", "l", "cl", "ml", "porcion/es", "taza/s", "cucharada/s"]

  belongs_to :meal
  belongs_to :food
  accepts_nested_attributes_for :food

  validates :quantity, :unit, presence: true
end
