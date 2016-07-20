json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :username, :like
  json.url comment_url(comment, format: :json)
end
