class Profile < ApplicationRecord
  model_name.instance_variable_set(:@route_key, 'profile')
  belongs_to :user
  has_one_attached :photo_of_profile  
end
