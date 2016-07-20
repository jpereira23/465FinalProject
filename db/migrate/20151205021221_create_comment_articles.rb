class CreateCommentArticles < ActiveRecord::Migration
  def change
    create_table :comment_articles do |t|
      t.integer :article_id
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
