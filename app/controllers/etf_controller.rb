class EtfController < ApplicationController

  get '/etf' do
    if session[:user_id]
      # @tweets = Tweets.all
    erb :'tweets/tweets'
    else
      redirect to '/login'
    end
  end

  get '/index2' do
    erb :'/etfs/index2'
  end

  get '/saftey_net' do
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user.save
    else
      @user = nil
    end
    @etf = Etf.all.where(:volatility => ["A+", "A"])
    erb :'etfs/index'
  end

  get '/conservative' do
    @etf = Etf.all.where(:volatility => ["A-", "B+"])
    erb :'etfs/index'
  end

  get '/moderate' do
    @etf = Etf.all.where(:volatility => ["B+", "B-"])
    erb :'etfs/index'
  end

  get '/aggressive' do
    @etf = Etf.all.where(:volatility => ["C", "C-"])
    erb :'etfs/index'
  end

  get '/etf/:slug' do
    @etf = Etf.find_by_slug(params[:slug])
    @etf.save
    erb :'/etfs/etf'
  end

  

end
