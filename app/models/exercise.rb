class Exercise < ApplicationRecord

    CATEGORIES = ["completo", "abdominales", "pectorales", "espalda", "hombros", "biceps", "triceps", "antebrazos", "piernas"].freeze
    MUSCLE_GROUPS = ["pecho alto", "pecho medio", "pecho bajo", "espalda alta", "espalda media", "espalda baja", "cuádriceps", "femorales", "hombro", "deltoides", "bíceps", "tríceps", "antebrazos", "pantorrillas"].freeze   

    acts_as_taggable_on :categories, :involved_muscles, :involved_equipments

    has_many :exercise_workouts
    has_many :workouts, -> { distinct }, through: :exercise_workouts
    
    has_many_attached :examples

    validates :name, presence: true
    validates :name, uniqueness: true

    def self.category_list
        self.all.map(&:category_list).flatten.uniq
    end

    def self.involved_muscle_list
        self.all.map(&:involved_muscle_list).flatten.uniq
    end

    def self.involved_equipment_list
        self.all.map(&:involved_equipment_list).flatten.uniq
    end
    
end
