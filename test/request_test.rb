require 'minitest/autorun'
require 'minitest/pride'
require 'socket'
require 'pry'

class RequestTest < Minitest::Test

  def setup
    @new_request = Request.new(1)

  end

  def test_request_exists
    assert_instance_of Request, @new_request
  end
end
