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

  get '/cars/:id/edit' do    
    @car = Car.find(params[:id])
    redirect '/login' if @car.driver != current_user
    erb :"/cars/edit"
  end
  
  patch '/cars/:id' do
    car = Car.find(params[:id])
    car.update(make: params[:make], model: params[:model], color: params[:color])
    redirect "/garages/#{car.garage_id}"
  end

  delete '/cars/:id/delete' do
    car = Car.find_by(id: params[:id])
    car.destroy if car.driver == current_user
    redirect back
  end
end