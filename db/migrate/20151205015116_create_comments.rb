class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :username
      t.integer :like

      t.timestamps null: false
    end
  end
end
