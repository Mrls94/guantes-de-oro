json.extract! daily_movement, :id, :user_id, :currency_id, :action, :value_foreign, :value_colombia, :exchange_rate, :created_at, :updated_at
json.url daily_movement_url(daily_movement, format: :json)
