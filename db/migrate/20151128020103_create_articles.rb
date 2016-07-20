class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :story
      t.integer :views
      t.integer :likes
      t.string :filename

      t.timestamps null: false
    end
  end
end
