MODELS
    user
      has many cars
      has password
      Unique
        attr :Username
        attr :Email
        attr :Password
    garage
      has many cars
      unique
        attr: name
    car
      belongs to user
      belongs to garage
        attr: maker
        attr: model
        foreign key: garage_id
        foreign key: user_id
CONTROLLERS
    application
      '/'
    user
      get '/signup'
      get '/login'
      get '/logout'
    garage
      get '/garage/:id'
        show.erb
      get '/garage/new'
        new.erb
      post '/garage'
        redirect garage/:id
    car
      get '/car/:id'
        show.erb
      get '/car/:id/edit'
        edit.erb
      get '/car/new'
        new.erb
      post 'car'
        redirect '/car/:id/'
      patch '/car/:id'
        redirect '/car/:id'
      delete '/car/:id/delete'
VIEWS
    index
      Show cars
    user
      Create new user
    Garage
      show.erb
      new.erb
    Cars
      Show.erb/ delete / link to edit
      edit.erb
      new.erb
    