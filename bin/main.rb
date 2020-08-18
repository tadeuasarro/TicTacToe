#!/usr/bin/env ruby

class Game
  attr_accessor :turn, :board
  attr_reader :player1, :player2

  def initialize (player1 = Player, player2 = Player, board = Board)
    @player1 = player1
    @player2 = player2
    @board = board
    @turn = 0
  end

  def round
      @board.display_board
      @turn += 1
      win_pos = check_win_move(@player1.token) if @turn.odd?
      win_pos = check_win_move(@player2.token) if @turn.even?
      puts "YOU CAN WIN THIS!!!!!" if win_pos
      print "#{@player1.name} (#{@player1.token}): " if @turn.odd?
      print "#{@player2.name} (#{@player2.token}): " if @turn.even?
      puts "Which position to take?"
      input = gets.chomp.to_i
      if @board.include?(input)
        @board[input - 1] = "#{@player1.token}" if @turn.odd?
        @board[input - 1] = "#{@player2.token}" if @turn.even?
      else
        @turn -= 1
        puts "Invalid play! Try again!"
      end
  end

  def start_game
    while @turn < 9
      round
      win = check_victory(@player1.token) if @turn.odd?
      win = check_victory(@player2.token) if @turn.even?
      finish_game if win
    end
    puts "NOBODY WON IT IS A DRAW"
  end

  def finish_game
    @board.display_board
    puts "#{@player1.name} WINS THE GAME!!!!!!! CONGRATULATIONS" if @turn.odd?
    puts "#{@player2.name} WINS THE GAME!!!!!!! CONGRATULATIONS" if @turn.even?
    exit(true)
  end

  def check_victory(token)
    counters = [0,0,0,0] # [cols,rows,diag1,diag2]
    (0..2).each do |i|
      counters[0]=[board[(i)],board[(i)+3],board[(i)+6]].count(token) # Checks the positions for the columns
      counters[1]=[board[i*3],board[(i*3)+1],board[(i*3)+2]].count(token)  # Checks the positions for the rows
      counters[2] += 1 if board[i*4] == token # Counts if a position in the main diagonal
      counters[3] += 1 if board[(i*2)+2] == token # Counts if a position in the oposite diagonal
      return true if counters.include? (3)

    end
    false
  end

  def check_win_move(token)
    diag1 = []
    diag2 = []

    (0..2).each do |i|
      col = [board[i], board[i + 3], board[i + 6]] # Gets the whole column
      row = [board[i * 3], board[(i * 3) + 1], board[(i * 3) + 2]] # Gets the whole row
      diag1.push(board[i * 4]) # Starts constructing the main diagonal
      diag2.push(board[(i * 2) + 2]) # Starts constructing the oposite diagonal
      return true if col.count(token) == 2 && col.any?(Numeric) # If it has a number in it and two tokens is a winning move

      return true if row.count(token) == 2 && row.any?(Numeric) # If it has a number in it and two tokens is a winning move

    end
    return true if diag1.count(token) == 2 && diag1.any?(Numeric) # Checks the main diagonal for the winning move

    return true if diag2.count(token) == 2 && diag2.any?(Numeric) # Checks the oposite diagonal for the winning move

    false
  end

end

class Player
  attr_reader :name,:token
  def initialize(name,token)
    @name = name
    @token = token
  end
end

class Board < Array
  def display_board
    print "\n\t---------------\n\t"
    each_with_index do |item, i|
      print "| #{item} |"
      print "\n\t---------------\n\t" if ((i + 1) % 3).zero?
    end
    print "\n"
  end
end

new_board = Board[1, 2, 3, 4, 5, 6, 7, 8, 9]

puts "First player? "
first_player = Player.new(gets.chomp.capitalize, 'X')
puts "Second player? "
second_player = Player.new(gets.chomp.capitalize, 'O')

new_game = Game.new(first_player, second_player, new_board)

new_game.start_game