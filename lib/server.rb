require './lib/request'
require 'pry'

class Server

  def initialize
    @requests = []
    @request_num = 0

  end

  def id

  end

  def new_request(id)
    @requests << Request.new(id)
    @request_num += 1
  end

  def requests_count
    @requests.count
  end

  def start
    puts "Sending response."
    sleep(2)

    new_request(@request_num)

    p @requests[0].start

  end
end
