# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

require 'thin'
require 'resque'
require 'resque/scheduler/server'

class ResqueServer < Resque::Server

  Resque::Server.use(Rack::Auth::Basic) do |username, password|
    username == 'roach' && password == 'roach1234'
  end

end

run Rails.application

run Rack::URLMap.new \
     "/" => Rails.application.load_server,
     "/resque" => ResqueServer.new
