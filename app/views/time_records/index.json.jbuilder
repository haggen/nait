json.array!(@time_records) do |time_record|
  json.extract! time_record, :date, :value, :author_id, :entry_id, :project_id
  json.url time_record_url(time_record, format: :json)
end
