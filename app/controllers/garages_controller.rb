class GaragesController < ApplicationController

  # GET: /garages
  get "/garages" do
    erb :"/garages/index.html"
  end

  # GET: /garages/new
  get "/garages/new" do
    erb :"/garages/new.html"
  end

  # POST: /garages
  post "/garages" do
    redirect "/garages"
  end

  # GET: /garages/5
  get "/garages/:id" do
    erb :"/garages/show.html"
  end

  # GET: /garages/5/edit
  get "/garages/:id/edit" do
    erb :"/garages/edit.html"
  end

  # PATCH: /garages/5
  patch "/garages/:id" do
    redirect "/garages/:id"
  end

  # DELETE: /garages/5/delete
  delete "/garages/:id/delete" do
    redirect "/garages"
  end
end
