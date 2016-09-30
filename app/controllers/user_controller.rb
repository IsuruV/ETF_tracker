class UserController < ApplicationController

  get '/signup' do
      if !session[:user_id]
      erb :'/users/signup'
    else
      redirect to '/users/:id'
    end
  end

  post '/signup' do
      if params[:user][:username].empty? || params[:user][:email].empty? || params[:user][:password].empty? || params[:user][:name].empty?
        flash[:message] = "Do not leave anything blank."
        redirect to '/signup'
      else
        @user = User.create(name:params[:user][:name],username:params[:user][:username],password:params[:user][:password],email:params[:user][:email])
        @user.save
        session[:user_id] = @user.id

        redirect to "users/#{@user.id}"
      end

  end

  get '/login' do
    if !session[:user_id]
      erb :'/users/login'
    else
      redirect to "/users/#{session[:user_id]}"
    end
  end

  post '/login' do
        if params[:username].empty? || params[:password].empty?
          redirect to '/login'
        else
        @user = User.find_by(username: params[:username])
          if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect to "/users/#{@user.id}"
        else
          redirect to '/signup'
          end
        end
  end

  get '/logout' do
    session.destroy
    redirect to '/home'
  end

  get "/users/:id" do
    if session[:user_id]
    @user = User.find(session[:user_id])
    @lists = List.all.where(:id => [@user.lists.ids])
    erb :'/lists/lists'
  else
    redirect to '/home'
  end
  end

end
