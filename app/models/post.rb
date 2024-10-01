class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  scope :ordered, -> {order(id: :desc)}
end
