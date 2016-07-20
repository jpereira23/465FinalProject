json.array!(@comment_users) do |comment_user|
  json.extract! comment_user, :id, :user_id, :comment_id
  json.url comment_user_url(comment_user, format: :json)
end
