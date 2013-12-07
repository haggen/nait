json.array!(@projects) do |project|
  json.extract! project, :name, :manager_id, :options
  json.url project_url(project, format: :json)
end
