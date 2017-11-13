class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  mapping do
    indexes :question, type: 'string'
    indexes :location, type: 'geo_point'
  end

  def as_indexed_json(options={})
    as_json(only: 'question').merge location: { lat: self.latitude, lon: self.longitude }
  end
end
