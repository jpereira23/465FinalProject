class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :str
      t.integer :like
      t.integer :dislike
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
