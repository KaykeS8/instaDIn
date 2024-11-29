class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, uniqueness: true
  validates :name, uniqueness: true
  has_one :profile, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, class_name: "Friend" , foreign_key: "follower_id", dependent: :destroy
  has_many :messages
end
