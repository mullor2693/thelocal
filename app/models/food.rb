class Food < ApplicationRecord

    COMPONENT_GROUPS = {1=>"Proximales", 2=>"Hidratos de Carbono", 3=>"Grasas", 4=>"Proteínas", 5=>"Ácidos orgánicos", 6=>"Vitaminas", 7=>"Minerales", 14=>"Compuestos carotenoides"}.freeze

    has_many :meal_foods
    has_many :meals, -> { distinct }, through: :meal_foods
    has_many :food_nutrients
    has_many :nutrients, -> { distinct }, through: :food_nutrients
    
    accepts_nested_attributes_for :food_nutrients, reject_if: proc { |attributes| attributes['nutrient_id'].blank? }

    validates :name, presence: true
    validates :name, uniqueness: true

    def kilocals
        (food_nutrients.joins(:nutrient).find_by('nutrients.name': 'energía, total')&.quantity || 0)*4.184
    end
    
end
