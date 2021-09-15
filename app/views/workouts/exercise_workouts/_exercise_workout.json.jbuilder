json.extract! exercise_workout, :id, :exercise_id, :workout_id, :serie_type, :serie_rest, :notes, :created_at, :updated_at
json.url exercise_workout_url(exercise_workout, format: :json)
