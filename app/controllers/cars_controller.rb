class CarsController < ApplicationController
  post '/cars' do
    garage = Garage.find_by(id: params[:garage_id])

    car = Car.new(
      make: params[:make],
      model: params[:model],
      color: params[:color]
    )
    car.driver = current_user
    car.garage = Garage.find(params[:garage_id])
    car.save
    redirect "/garages/#{car.garage_id}"
  end
end