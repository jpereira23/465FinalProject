class CreateTagArticles < ActiveRecord::Migration
  def change
    create_table :tag_articles do |t|
      t.integer :article_id
      t.integer :tag_id
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
