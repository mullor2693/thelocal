class CreateExerciseSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_series do |t|
      t.integer :reps
      t.decimal :weight
      t.integer :time_track
      t.belongs_to :exercise_workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
