class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes

  scope :ordered, -> {order(id: :desc)}
end
