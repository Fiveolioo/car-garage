require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    redirect :garage
  end

  get '/' do
    redirect :movies
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def session_info
      session
    end
  end
end

end
