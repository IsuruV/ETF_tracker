class EtfController < ApplicationController
  use Rack::MethodOverride
  get '/etf' do
    if session[:user_id]
      # @tweets = Tweets.all
    erb :'tweets/tweets'
    else
      redirect to '/login'
    end
  end
  # get '/etfs' do
  #   if session[:user_id]
  #     @user = User.find(session[:user_id])
  #   else
  #     @user = nil
  #   end
  #   if params[:choice] == "saftey_net"
  #     @etfs = Etf.all.where(:volatility => ["A+", "A"])
  #     erb :'etfs/index'
  #   elsif params[:choice] == "conservative"
  #     @etfs = Etf.all.where(:volatility => ["A-", "B+"])
  #     erb :'etfs/index'
  #   elsif params[:choice] == "moderate"
  #     @etfs = Etf.all.where(:volatility => ["B+", "B-"])
  #     erb :'etfs/index'
  #   elsif params[:choice] == "aggressive"
  #     @etfs = Etf.all.where(:volatility => ["C", "C-"])
  #     erb :'etfs/index'
  #   else
  #     redirect to '/home'
  #   end
  # end

  get '/saftey_net' do
    @type = "Saftey Net"
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user.save
    else
      @user = nil
    end
    @etfs = Etf.all.where(:volatility => ["A+", "A"])
    erb :'etfs/index'
  end

  get '/conservative' do
    @type = "Conservative"
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user.save
    else
      @user = nil
    end
    @etfs = Etf.all.where(:volatility => ["A-", "B+"])
    erb :'etfs/index'
  end

  get '/moderate' do
    @type = "Moderate"
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user.save
    else
      @user = nil
    end
    @etfs = Etf.all.where(:volatility => ["B+", "B-"])
    erb :'etfs/index'
  end

  get '/aggressive' do
    @type = "Aggressive"
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user.save
    else
      @user = nil
    end
    @etfs = Etf.all.where(:volatility => ["C", "C-"])
    erb :'etfs/index'
  end

  get '/etf/:slug' do
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user.save
    else
      @user = nil
    end
    begin
        @etf = Etf.find_by_slug(params[:slug])
    rescue
        @etf = Etf.find_by(symbol:params[:symbol])
    end
    # @etf = Etf.find_by_slug(params[:slug])
    erb :'/etfs/etf'
  end

  post "/etf/search" do
    begin
    @symbol = params[:symbol].downcase
    redirect to "/etf/#{@symbol}"
    rescue
      redirect to '/home'
    end
  end



end
