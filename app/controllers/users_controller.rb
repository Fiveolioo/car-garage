class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    erb :"/users/new.html"
  end

  get "/login" do
    erb :"/users/login.html"
  end

  post "/logout" do
    redirect '/'
  end

  get "/users/:id" do
    erb :"/users/show.erb"
  end

  post "/users" do
    user = params
    User.create()
    redirect "/users"
  end
  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
