json.array!(@memberships) do |membership|
  json.extract! membership, :user_id, :project_id
  json.url membership_url(membership, format: :json)
end
