class Message < ApplicationRecord
  belongs_to :sender_user, class_name: "User"
  belongs_to :chat
  
  validates :content, presence: true
  after_create_commit { broadcast_append_to self.chat}
end
