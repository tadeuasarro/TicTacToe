#!/usr/bin/env ruby

class Game
  attr_accessor :turn, :board

  def initialize
    self.turn  = 0
    self.board = Array(1..9)
  end

  def track_turns
    self.turn.zero? ? self.turn=1 : self.turn=0
  end

  def check_victory_conditions
  end

  def check_position_availability
  end

end

class Player < Game
  attr_accessor :name, :token

  def to_play
  end

end

class Display < Game
  def board_display
  end

  def message_display
  end

  def positive_negative_question
  end

end

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
player1 = Player.new
player2 = Player.new
init=''
loop do
  print 'Enter the name of player #1: '
  player1.name = gets.chomp
  player1.token = 'X'
  print 'Enter the name of player #2: '
  player2.name = gets.chomp
  player2.token = 'O'
  puts "\n Welcome #{player1.name} your token will be X\n"
  puts "\n Welcome #{player2.name} your token will be O\n\n"
  loop do
    print 'Is this information OK?[y/n]: '
    init = gets.chomp
    break if init=='y' || init=='n'
  end
  break unless init != 'y'
end

players = [player1, player2]
tokens = %w[X O]
turn = 0

puts "\n\n Lets begin our TIC TAC TOE GAME!!!!!!\n\n"

board = Array(1..9)
end_game = false
loop do
  print "\n\nIt's #{players[turn].name} turn, THINK YOUR MOVE!!!!!!!\n"
  print "\n\t---------------\n\t"
  board.each_with_index do |item, i|
    print "| #{item} |"
    print "\n\t---------------\n\t" if ((i + 1) % 3).zero?
  end
  print "\n"

  print " #{players[turn].name} Enter the position which you want to place your #{tokens[turn]}: "
  move = gets.chomp.to_i
  next if move.zero? || move > 9 || move < 1

  board[move - 1] = tokens[turn]
  turn.zero? ? turn=1 : turn=0
  board.all?(String) ? end_game = true : nil
  puts move
  break unless end_game != true
end