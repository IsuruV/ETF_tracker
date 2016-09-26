require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  # use Rack::Flash
  # use Rack::MethodOverride
  # register Sinatra::ActiveRecordExtension
  # register Sinatra::ActiveRecordExtension
  # register Sinatra::Twitter::Bootstrap::Assets
  #
  # enable :sessions
  # set :session_secret, "my_application_secret"
  # set :views, Proc.new { File.join(root, "../views/") }

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

    end


end
