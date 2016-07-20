json.array!(@tag_devises) do |tag_devise|
  json.extract! tag_devise, :id, :devise_id, :tag_id
  json.url tag_devise_url(tag_devise, format: :json)
end
