class User < ActiveRecord::Base
  has_secure_password
  has_many :cars
  has_many :garages, through: :cars
end