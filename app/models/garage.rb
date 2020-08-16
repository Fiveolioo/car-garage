class Garage < ActiveRecord::Base
    has_many :cars
    has_many :drivers, through: :cars, source: :car
end
