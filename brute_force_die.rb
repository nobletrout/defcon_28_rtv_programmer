# finds uot the 20 sided dice solution for two of the three RTV challengers
require 'socket'
require 'ipaddr'

roll_guess = (1..20).to_a
correct_guesses = [15]

while true
  s = TCPSocket.new '164.90.147.2', 1235
  i = 1
  while line = s.gets
    puts line
    # first guess
    if line == "What did you roll?\n"
      puts "guessing the number 15"
      s.puts "15"
    end
    # later guesses
    if line == "Roll again!\n"
      # have to guess
      if correct_guesses[i].nil?
        puts "guessing the wrong number\n"
        s.puts "100"
      else
        puts "i know this one, it's #{correct_guesses[i]}"
        s.puts "#{correct_guesses[i]}"
        i = i + 1
      end
    else
      if number = /\d+/.match(line)
        correct_number = number.to_s.to_i
        next if correct_number > 20
        puts "the right number was #{correct_number}"
        correct_guesses << correct_number
      end
    end
  end
  s.close
end
