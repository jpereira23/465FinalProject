json.array!(@comment_articles) do |comment_article|
  json.extract! comment_article, :id, :article_id, :comment_id
  json.url comment_article_url(comment_article, format: :json)
end
