class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  include DeviseTokenAuth::Concerns::User
end
