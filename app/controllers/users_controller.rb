class UsersController < ApplicationController

  get "/login" do
    erb :"/users/login"
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else redirect back
    end
  end
  
  post "/logout" do
    session.destroy
    redirect '/login'
  end
  
  get "/users/:id" do
    @user = User.find_by(id: params[:id])
    redirect back unless @user 
    garage_ids = @user.cars.map { |car| car[:garage_id] }
    @garages = Garage.all.select { |garage| garage_ids.include?(garage.id) }
    erb :'/users/show'
  end


  get "/signup" do
    redirect "/users/#{current_user.id}" if logged_in?
    erb :'/users/signup'
  end

  post "/signup" do
    if params.values.any?(&:empty?) || User.find_by(username: params[:username]) || User.find_by(email: params[:email])
     redirect '/signup'
    else User.create(
     username: params[:username],
     email: params[:email],
     password: params[:password]
   )
    redirect "/login"
    end
  end
end
