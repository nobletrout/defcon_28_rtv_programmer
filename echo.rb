# really stupid challenge. Send packets back that you get, result is string
require 'socket'
require 'ipaddr'


while true
  #s = TCPSocket.new '164.90.147.2', 2345 
  s = TCPSocket.new '164.90.147.2', 2346 
  while line = s.gets
    print line[0]
    next unless line.length == 2
    # first guess
    s.puts(line)
    abort if /ts{/.match(line)
  end
  s.close
end
