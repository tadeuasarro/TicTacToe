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

puts "\n\n Lets get to know our participants!!!!!!\n\n"
player1 = ''
player2 = ''
init=''
loop do
  print 'Enter the name of player #1: '
  player1 = gets.chomp
  print 'Enter the name of player #2: '
  player2 = gets.chomp
  puts "\n Welcome #{player1} your token will be X\n"
  puts "\n Welcome #{player2} your token will be O\n\n"
  loop do
    print 'Is this information OK?[y/n]: '
    init = gets.chomp
    break if init=='y' || init=='n'
  end
  break unless init != 'y'
end