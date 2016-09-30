class ListController < ApplicationController
  get '/lists/index' do
    erb :'lists/index'
  end

  get '/lists/new' do
    if session[:user_id]
    erb :'lists/new'
  else
    redirect to '/login'
  end
end

  post '/lists/new' do
    @list = List.new(:name => params[:name], :description => params[:description])
    @list.save
    @user = User.find(session[:user_id])
    @user.lists << @list
    @user.save
    redirect to "/users/#{@user.id}"
  end


  patch '/lists/add_etfs' do
    # @list = List.find_by(params[:list][:name])
    @list = List.find(params[:list][:name])
    @list.etfs << Etf.find(params[:etf][:id])
    # @list.etfs << Etf.find(params[:etfs][:id])
    @list.save
    # redirect to '/saftey_net'
    # session[:user_id] = params[:user_id]
    redirect to "/users/#{session[:user_id]}"

  end

  delete '/lists/:list_id/etfs/:etf_id/delete' do
    @user = User.find(session[:user_id])
    @user.save
    @list = @user.lists.find(params[:list_id])
    @list.save
    @etf = @list.etfs.find(params[:etf_id])
    @etf.save
    @etf.delete
    redirect to "/users/#{session[:user_id]}"
  end

  delete '/lists/:list_id/delete' do
    @user = User.find(session[:user_id])
    @user.save
    @list = @user.lists.find(params[:list_id])
    @list.save
    @list.delete
    redirect to "/users/#{session[:user_id]}"
  end
end
