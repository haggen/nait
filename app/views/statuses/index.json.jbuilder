json.array!(@statuses) do |status|
  json.extract! status, :user_id, :project_id
  json.url status_url(status, format: :json)
end
