json.array!(@users) do |user|
  json.extract! user, :name, :email, :password_digest, :options
  json.url user_url(user, format: :json)
end
