class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    redirect "/users/#{current_user.id}" if logged_in?
    @fail = params[:fail]
    erb :'/users/signup'
  end

  post "/signup" do
    if params.values.any?(&:empty?)
    elsif User.find_by(username: params[:username])
    elsif User.find_by(email: params[:email])
     redirect '/signup?error=Invalid, please try again :('
    else User.create(
     username: params[:username],
     email: params[:email],
     password: params[:password]
   )
    redirect "/login"
    end
  end

  get "/login" do
    redirect "/users/#{current_user.id}" if logged_in?
    @fail = params[:fail]
    erb :'/users/login'
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
