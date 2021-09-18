class Workout < ApplicationRecord
  include Weekable
  belongs_to :training
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :exercise_workouts
  has_many :exercises, -> { distinct }, through: :exercise_workouts

  before_validation :clean_weekdays
  validates_presence_of :name
end
