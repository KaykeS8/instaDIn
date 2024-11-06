class Friend < ApplicationRecord
    belongs_to :followed, class_name: 'User'
    belongs_to :follower, class_name: 'User'

    validates :follower_id, presence: true
    validates :followed_id, presence: true
    validates :followed_id, uniqueness: {scope: :follower_id, message: "Ja esta na lista de amigos"}
end
