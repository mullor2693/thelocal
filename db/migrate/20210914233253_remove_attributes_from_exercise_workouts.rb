class RemoveAttributesFromExerciseWorkouts < ActiveRecord::Migration[6.1]
  def change
    remove_column :exercise_workouts, :serie_reps
    remove_column :exercise_workouts, :series
  end
end
