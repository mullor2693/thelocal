class ExerciseWorkout < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  has_many :exercise_series
  accepts_nested_attributes_for :exercise_series, allow_destroy: true, reject_if: :all_blank

  TYPES = {0=>"Reps y Carga", 1=>"Tiempo", 2=>"Repeticiones", 3=>"Carga"}.freeze

  validates_inclusion_of :serie_type, :in => 0..3
  # validates_inclusion_of :serie_reps, :in => 1..5
  validates_inclusion_of :serie_rest, :in => 0..120


  def serie_type_name
    TYPES[serie_type]
  end

  def typed_series
    types_series = series.first(serie_reps || series.count)
    types_series.each do |serie|
      serie[1] = case serie_type
      when 0
        serie[1].slice("reps", "weight")
      when 1
        serie[1].slice("time")
      when 2
        serie[1].slice("reps")
      when 3
        serie[1].slice("weight")
      else
        serie[1]
      end
    end
  end

end
