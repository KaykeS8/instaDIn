class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, uniqueness: true
  has_many :likes, dependent: :destroy
  has_many :posts
end
