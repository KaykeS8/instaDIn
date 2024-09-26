class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :content, null: false
      t.text :description, default: ""
      t.references :user, null: false, foreign_key: true
      t.integer :number_of_likes, default: 0, null: false

      t.timestamps
    end
  end
end
