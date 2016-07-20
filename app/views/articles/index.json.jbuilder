json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :story, :views, :likes, :filename
  json.url article_url(article, format: :json)
end
