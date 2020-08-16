class UsersController < ApplicationController

  get "/signup" do
    redirect "/users/#{current_user.id}" if logged_in?
    @fail = params[:fail]
    erb :'/users/signup'
  end

  post "/signup" do
    if params.values.any?(&:empty?)
    elsif User.find_by(username: params[:username])
    elsif User.find_by(email: params[:email])
     redirect '/signup'
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
    session.destroy
    redirect '/login'
  end

  get "/users/:id" do
    erb :"/users/show.erb"
  end
end
