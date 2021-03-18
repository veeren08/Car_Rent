class Vehicle < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :reservation
  has_one_attached :car_avatar
end
