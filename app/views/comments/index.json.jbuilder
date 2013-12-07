json.array!(@comments) do |comment|
  json.extract! comment, :content, :author_id, :commentable_id
  json.url comment_url(comment, format: :json)
end
