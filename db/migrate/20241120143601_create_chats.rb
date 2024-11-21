class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :sender_user, null: false, foreign_key: {to_table: :users}
      t.references :recipient_user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
