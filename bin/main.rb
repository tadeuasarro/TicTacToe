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
      print "#{@player1.name}: " if @turn.odd?
      print "#{@player2.name}: " if @turn.even?
      puts "Which position to take?"
      input = gets.chomp
      if @board.include?(input.to_i)
        #put some victory check method here
      else
        @turn -= 1
        puts "Invalid play! Try again!"
      end
  end

  def start_game
    while @turn < 9
      round
    end
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