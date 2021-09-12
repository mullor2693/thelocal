json.extract! meal_food, :id, :meal_id, :food_id, :quantity, :unit, :created_at, :updated_at
json.url meal_food_url(meal_food, format: :json)