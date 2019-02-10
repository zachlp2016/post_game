require './lib/server'
require './lib/request'

class Runner

  def initialize
    @server = Server.new
  end

  def start
    @server.start
  end

end


new_server = Runner.new
p new_server.start
