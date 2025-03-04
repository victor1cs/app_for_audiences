json.extract! audience, :id, :number, :state, :city, :address, :date_time, :price, :expense, :status, :user_id, :notifications, :created_at, :updated_at
json.url audience_url(audience, format: :json)
