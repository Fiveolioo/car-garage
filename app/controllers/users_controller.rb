class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    redirect "/users/#{current_user.id}" if logged_in?
    @fail = params[:fail]
    erb :'/users/signup'
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
end
