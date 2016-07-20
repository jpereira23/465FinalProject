json.array!(@tag_articles) do |tag_article|
  json.extract! tag_article, :id, :article_id, :tag_id, :article_id
  json.url tag_article_url(tag_article, format: :json)
end
