class GaragesController < ApplicationController
  
  get '/garages/new' do
    erb :'/garages/new'
  end

  post '/garages' do
    if params.values.any?(&:empty?)
      redirect back
    else
    garage = Garage.create(params)
    redirect '/garages'
    end
  end

  get '/garages/:id' do
    @garage = Garage.find_by(id: params[:id])
    user_ids = @garage.cars.map { |car| car[:user_id] }
    @users = User.all.select { |user| user_ids.include?(user.id) }
    erb :'/garages/show'
  end

  get '/garages' do
    @garages = Garage.all
    erb :'/garages/index'
  end

  get '/garages/:id/edit' do    
    @garage = Garage.find(params[:id])
    erb :"/garages/edit"
  end

  patch '/garages/:id' do
    garage = Garage.find(params[:id])
    garage.update(name: params[:name])
    redirect "/garages"
    end
  end