class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
<<<<<<< HEAD
    @user = User.create(params)
    @user.save
    session[:id] = @user.id
=======
    User.create(params)
    @session = session
>>>>>>> d62e6c96d5c4a7108f3d8955fa90afb84704896d
    redirect '/users/home'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    if @user = User.find_by(email: params['email'], password: params['password'])
      session[:id] = @user.id
      redirect '/users/home'
    else
      redirect '/sessions/login'
    end
  end

  get '/sessions/logout' do
<<<<<<< HEAD
    session.clear
=======

>>>>>>> d62e6c96d5c4a7108f3d8955fa90afb84704896d
    redirect '/'
  end

  get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end

end
