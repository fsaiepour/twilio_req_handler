require Sinatrarequire 'sinatra/base'
require 'twilio-ruby'

class WebApp <Sinatra::Base
  set :port, 4001

  post '/call_joined' do
    RequestHandler::CallHandler.call_joined
  end

  #Delegate the call leg status change to another process
  post '/status_changed' do
    RequestHandler::StatusHandler.status_changed(params)
    "OK"
  end

  run! if app_file == $0
end
