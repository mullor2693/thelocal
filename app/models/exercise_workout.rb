class ExerciseWorkout < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  has_many :exercise_series
  accepts_nested_attributes_for :exercise_series, allow_destroy: true, reject_if: :all_blank

  TYPES = {0=>"Reps y Carga", 1=>"Tiempo", 2=>"Repeticiones", 3=>"Carga"}.freeze

  validates_inclusion_of :serie_type, :in => 0..3
  validates_inclusion_of :serie_rest, :in => 0..120


  def serie_type_name
    TYPES[serie_type]
  end

  def print_series_counter
    counter = exercise_series.count
    counter != 0 ? (counter.to_s + (counter != 1 ? " series" : " serie" )): "Sin series"
  end

end
