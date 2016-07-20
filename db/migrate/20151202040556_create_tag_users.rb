class CreateTagUsers < ActiveRecord::Migration
  def change
    create_table :tag_users do |t|
      t.integer :user_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
