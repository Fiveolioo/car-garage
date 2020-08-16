class GaragesController < ApplicationController
  get '/garages/new' do
    erb :'/garages/new'
  end
end