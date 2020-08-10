# RTV validates IP addresses against netmasks
# returns count of ip addresses
require 'csv'
require 'ipaddr'
addr = CSV.read('ipaddress.txt')

valid_addr = []

addr.each do |x|
  begin
    foo = IPAddr.new(x[1])
    foo2 = IPAddr.new(x[0])
    next unless foo.include?(foo2)
    valid_addr << foo2
  rescue IPAddr::InvalidAddressError => e
    next
  end
end

puts "total count #{valid_addr.count}"
