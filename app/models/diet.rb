class Diet < ApplicationRecord
  include Weekable

  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  has_many :diet_meals
  has_many :meals, through: :diet_meals
  accepts_nested_attributes_for :meals

  before_validation :clean_weekdays

  validates :name, :weekdays, presence: true

  def meals_attributes=(meal_attributes)
    meal_attributes.values.each do |meal_attribute|
      meal = Meal.find_or_create_by(meal_attribute)
      self.meals << meal
    end
  end

end
