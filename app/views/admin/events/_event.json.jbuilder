json.extract! event, :id, :name, :description, :start_date, :end_date, :is_full_event, :is_recurring, :creator_id, :parent_event_id, :created_at, :updated_at
json.url event_url(event, format: :json)
