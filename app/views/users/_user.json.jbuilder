json.extract! user, :id, :name, :email, :password, :cellphone, :admin, :oab, :created_at, :updated_at
json.url user_url(user, format: :json)
