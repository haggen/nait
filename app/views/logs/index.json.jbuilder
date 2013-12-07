json.array!(@logs) do |log|
  json.extract! log, :date, :value, :author_id, :entry_id, :project_id
  json.url log_url(log, format: :json)
end
