class User < ActiveRecord::Base
  has_secure_password
  has_many :cars
  has_many :car_garages, through: :car, source: :garage
end