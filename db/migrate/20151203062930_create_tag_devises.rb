class CreateTagDevises < ActiveRecord::Migration
  def change
    create_table :tag_devises do |t|
      t.integer :devise_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
