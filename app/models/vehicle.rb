class Vehicle < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :reservation
end
