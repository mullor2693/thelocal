json.extract! workout, :id, :name, :description, :weekdays, :user_id, :created_at, :updated_at
json.url workout_url(workout, format: :json)
