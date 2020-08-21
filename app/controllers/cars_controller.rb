class CarsController < ApplicationController
  post '/cars' do
    if params.values.any?(&:empty?)
      redirect back
    else
    garage = Garage.find_by(id: params[:garage_id])
    car = current_user.cars.build(params)
    car.save
    redirect "/garages/#{car.garage_id}"
    end
  end

  get '/cars/:id/edit' do    
    @car = Car.find(params[:id])
    redirect '/login' if @car.driver != current_user
    erb :"/cars/edit"
  end
  
  patch '/cars/:id' do
    if params.values.any?(&:empty?)
      redirect back
    else
    car = Car.find(params[:id])
    car.update(make: params[:make], model: params[:model], color: params[:color])
    redirect "/garages/#{car.garage_id}"
    end
  end

  delete '/cars/:id/delete' do
    car = Car.find_by(id: params[:id])
    car.destroy if car.driver == current_user
    redirect back
    end
  end