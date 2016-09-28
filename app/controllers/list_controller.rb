class ListController < ApplicationController
  get '/lists/index' do
    erb :'lists/index'
  end

  get '/lists/new' do
    erb :'lists/new'
  end

  post '/lists/new' do
    @list = List.new(:name => params[:name], :description => params[:description])
    @list.save
    @user = User.find(session[:user_id])
    @user.lists << @list
    @user.save
    redirect to "/users/#{@user.id}"
  end


  post '/lists/add_etfs' do
    @list = List.find_by(params[:list][:name])
    @list.etfs << Etf.find(params[:etfs][:id])
    @list.save
    # redirect to '/saftey_net'
    redirect to "/users/#{param[:user_id]}"

  end

  post '/lists/:list_id/etfs/:etf_id/delete' do
    @user = User.find(session[:user_id])
  end
end

delete '/tweets/:id/delete' do
# post '/tweets/:id/delete' do
 @tweet = Tweet.find(params[:id])
 @tweet.save
 if @tweet.user_id == session[:user_id]
 @tweet.delete
 redirect to '/tweets'
 else
   redirect to '/tweets'
 end
end
