# solves the third die challange
require 'socket'
require 'ipaddr'

roll_guess = (1..20).to_a
correct_guesses = [15]

while true
  s = TCPSocket.new '164.90.147.2', 1236
  while line = s.gets
    puts line
    # first guess
    if line == "What did you roll?\n"
      s.puts "#{roll_guess.sample}"
    end
    # later guesses
    if line == "Roll again!\n"
      # have to guess
      puts "guessing again\n"
      s.puts "#{roll_guess.sample}"
    end
    abort if /ts{/.match(line)
  end
  s.close
end
