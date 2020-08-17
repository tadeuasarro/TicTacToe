#!/usr/bin/env ruby
p 'Hello World From Brazil and Colombia'
puts '****************************************************************'
puts '*                    TIC TAC TOE THE GAME                      *'
puts '****************************************************************'
print "\n\n"
puts ' Welcome to the TIC TAC TOE game. This is a two player game so'
puts ' make sure you have a friend to play with.'
puts ' The rules are simple: The first player to get 3 tokens in line'
puts ' wins. Bring your A game'
print "\n\n"

loop do
  print 'Do you want to start the game?[y/n]: '
  init = gets.chomp
  if init == 'n'
    puts 'Thank you for playing'
    return
  end
  break unless init != 'y' && init != 'n'
end