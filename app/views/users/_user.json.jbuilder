json.extract! user, :id, :first_name, :last_name, :email, :biography, :purpose, :days, :active, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
