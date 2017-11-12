class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  geocoded_by :address
end
