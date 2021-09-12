class CreateExerciseWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_workouts do |t|
      t.belongs_to :exercise, null: false, foreign_key: true
      t.belongs_to :workout, null: false, foreign_key: true
      t.integer :serie_type
      t.integer :serie_reps
      t.integer :serie_rest
      t.text :notes
      t.json :series, default: {0 => {reps: 0, weight: 0, time: 0}, 1 => {reps: 0, weight: 0, time: 0}, 2 => {reps: 0, weight: 0, time: 0}, 3 => {reps: 0, weight: 0, time: 0}, 4 => {reps: 0, weight: 0, time: 0} }

      t.timestamps
    end
  end
end
