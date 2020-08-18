#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockLength

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player.rb'

loop do
  new_board = Board.new

  puts 'First player? '
  first_player = Player.new(gets.chomp.capitalize, 'X')
  puts 'Second player? '
  second_player = Player.new(gets.chomp.capitalize, 'O')

  new_game = Game.new(first_player, second_player, new_board)

  # Starts the game
  while new_game.turn < 9
    new_board.display_board
    new_game.turn += 1
    # Checks for the winning position
    win_pos = new_game.check_win_move(first_player.token, new_board.board) if new_game.turn.odd?
    win_pos = new_game.check_win_move(second_player.token, new_board.board) if new_game.turn.even?
    puts 'YOU CAN WIN THIS!!!!!' if win_pos

    # Asks the player for the position
    print "#{first_player.name} (#{first_player.token}): " if new_game.turn.odd?
    print "#{second_player.name} (#{second_player.token}): " if new_game.turn.even?
    puts 'Which position to take?'
    input = gets.chomp.to_i

    # Checks if the position is valid
    pos_valid = new_game.check_position(input, new_board.board)
    if pos_valid
      new_board.take_position(input, first_player.token) if new_game.turn.odd?
      new_board.take_position(input, second_player.token) if new_game.turn.even?
    else
      new_game.turn -= 1
      puts 'Invalid play! Try again!'
    end

    # Victory check
    win = new_game.check_victory(first_player.token, new_board.board) if new_game.turn.odd?
    win = new_game.check_victory(second_player.token, new_board.board) if new_game.turn.even?

    if new_game.turn.odd? && win
      new_board.display_board
      puts "#{first_player.name} WINS THE GAME!!!!!!! CONGRATULATIONS"
      break
    elsif new_game.turn.even? && win
      new_board.display_board
      puts "#{second_player.name} WINS THE GAME!!!!!!! CONGRATULATIONS"
      break
    end
    puts 'NOBODY WON IT IS A DRAW' if new_game.turn == 9
  end

  print "\nDo you want to play again? [y/n]: "
  input = gets.chomp.downcase

  break if input == 'n'
end
# rubocop:enable Metrics/BlockLength
