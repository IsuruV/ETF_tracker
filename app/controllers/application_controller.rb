require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

    register Sinatra::ActiveRecordExtension
    register Sinatra::Twitter::Bootstrap::Assets
    enable :sessions
    use Rack::Flash
    use Rack::MethodOverride
    set :session_secret, "my_application_secret"

    configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    end

    get '/' do
      erb :'applications/home'
    end


end
