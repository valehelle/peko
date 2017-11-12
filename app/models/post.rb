class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  reverse_geocoded_by :latitude, :longitude, :address => :location
  after_validation :reverse_geocode
end
