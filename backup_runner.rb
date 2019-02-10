require 'socket'
require 'pry'


tcp_server = TCPServer.new("192.168.0.194", 9292)
# tcp_server = TCPServer.new("0.0.0.0", 9292)
client = tcp_server.accept

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


puts "Sending response."
sleep(2)
path =
diagnostics = ["Verb: POST",
  "Path: /#{path}",
  "Protocol: HTTP/1.1",
  "Host: 127.0.0.1",
  "Port: 9292",
  "Origin: 127.0.0.1",
  "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
].join("\r\n")
hello_world = "Hello World!"
response = "<pre>" + diagnostics + "</pre>"
output = "<html><head>#{hello_world}</head><body>#{response}</body></html>"
headers = ["http/1.1 200 ok",
  "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
  "server: ruby",
  "content-type: text/html; charset=iso-8859-1",
  "content-length: #{output.length}\r\n\r\n"].join("\r\n")


client.puts headers
client.puts output

puts ["Wrote this response:", headers, output].join("\n")
sleep(2)

# client.close
puts "\nResponse complete, exiting."
sleep(2)
