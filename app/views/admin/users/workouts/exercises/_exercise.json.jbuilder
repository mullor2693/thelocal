json.extract! exercise, :id, :name, :description, :created_at, :updated_at
json.url admin_exercise_url(exercise, format: :json)
