class GaragesController < ApplicationController
  get '/garages/new' do
    erb :'/garages/new'
  end

  post '/garages' do
    garage = Garage.create(
      name: params[:name]
    )
    redirect "/garages/#{garage.id}"
  end

  get '/garages' do
    @garages = Garage.all
    erb :'/garages/index'
  end
end