class Vehicle < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :reservation
  has_one_attached :car_avatar
  has_one_attached :video_avatar

  validates :license, :presence => true
  validates :PlateNumber, :presence => true
  validates :manufacturer, :presence => true
  validates :model, :presence => true
  validates :hourlyRentalRate, :presence => true
  validates :style, :presence => true
  validates :status, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :country, :presence => true
  validates :mobile, :presence => true, :numericality => true, :length => { :minimum => 10, :maximum => 10 }
end
