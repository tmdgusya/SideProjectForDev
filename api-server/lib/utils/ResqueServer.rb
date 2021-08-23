require 'thin'
require 'resque'
require 'resque/server'
require 'resque/scheduler/server'

class ResqueServer < Resque::Server

  Resque::Server.use(Rack::Auth::Basic) do |username, password|
    username == 'roach' && password == 'roach1234'
  end

  run Rack::URLMap.new \
     "/" => Resque::Server.new

end
