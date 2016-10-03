require 'sinatra/base'
require 'twilio-ruby'
require_relative 'request_handler'
require 'pry'

class WebApp <Sinatra::Base
  set :port, 4001

  post '/call_joined' do
    #binding.pry
    RequestHandler::CallHandler.call_joined
  end

  #Delegate the call leg status change to another process
  post '/status_changed' do
    #binding.pry
    RequestHandler::StatusHandler.status_changed(params["CallStatus"],params["Called"])
    "OK"
  end

  run! if app_file == $0
end
