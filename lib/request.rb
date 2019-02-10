require 'socket'


class Request

  def initialize(request_id)
    @request_id = request_id
    @tcp_server = TCPServer.new "192.168.0.194", 9292
    # @path = Path.new()
    @client = @tcp_server.accept
  end

  def start
    @client.puts headers
    @client.puts output
    @client.puts response
    @client.puts diagnostics
    # @client.close
    print_output
  end

  def request_start
    send_response = "Sending response."
    p send_response
    sleep(2)
  end

  def processing
    puts "Ready for a request"
    sleep(2)
    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end


    puts "Got this request:"
    sleep(2)
    puts request_lines.inspect
    sleep(2)
  end



  def diagnostics
    diagnostics = ["Verb: POST",
                  "Path: #{@path}",
                  "Protocol: HTTP/1.1",
                  "Host: 127.0.0.1",
                  "Port: 9292",
                  "Origin: 127.0.0.1",
                  "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                  ].join("\r\n")
    p diagnostics
  end

  def print_id
    print_id = @request_id
  end

  def hello_world
    hello_world = "Hello World!"
  end

  def server_requests
    server.requests_count
  end

  def response
    response = "<pre>" + diagnostics + "</pre>"
    p response
  end

  def output
    output = "<html><head>#{hello_world}#{" "}#{"("}#{print_id}#{")"}</head><body>#{response}</body></html>"
    p output
  end

  def headers
    headers = ["http/1.1 200 ok",
                "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
                "server: ruby",
                "content-type: text/html; charset=iso-8859-1",
                "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    p headers
  end

  def print_output
    puts ["Wrote this response:", headers, output].join("\n")
    sleep(2)
    puts "\nResponse complete, exiting."
    sleep(2)
  end

end
