json.extract! event, :id, :user_id, :title, :description, :event_date, :created_at, :updated_at
json.url event_url(event, format: :json)
