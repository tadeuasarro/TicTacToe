#!/usr/bin/env ruby

# Welcome screen for the game
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

# Gets the information on the participants
puts "\n\n Lets get to know our participants!!!!!!\n\n"
player1 = ''
player2 = ''
init = ''
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
    break if %w[y n].include?(init)
  end
  break unless init != 'y'
end

players = [player1, player2] # Groups the players into one array for easy access
tokens = %w[X O] # Keeps the tokens for each player
turn = 0 # Turn = 0 is player1's turn and turn = 1 is player2's turn

puts "\n\n Lets begin our TIC TAC TOE GAME!!!!!!\n\n"

board = Array(1..9) # Sets the board
end_game = false # Ensures the game is not going to end immediatly
loop do
  # Prints the board
  print "\n\nIt's #{players[turn]} turn, THINK YOUR MOVE!!!!!!!\n"
  print "\n\t---------------\n\t"
  board.each_with_index do |item, i|
    print "| #{item} |"
    print "\n\t---------------\n\t" if ((i + 1) % 3).zero?
  end
  print "\n"

  # Section to check if the next move could be a winning move for the player
  #   If the move is a winning move it shows a message
  # End of the winning move section

  # Asks the player for the move he wants to make
  print " #{players[turn]} Enter the position which you want to place your #{tokens[turn]}: "
  move = gets.chomp.to_i
  # Section to check if the move is available
  if move > 9 || move < 1
    puts 'Out of range select another position'
    next
  elsif board[move - 1].is_a? String
    puts 'Position taken!!!! Select another one'
    next
  end

  # If the move is available puts it in the board
  board[move - 1] = tokens[turn]

  # Section for checking the end of the game
  # Check if the current player won
  board.all?(String) ? end_game = true : nil # If it is a draw it finishes the game
  # End of the end of the game checking section

  turn = turn.zero? ? 1 : 0 # Switches the turn to the next player
  puts move
  break if end_game
end
