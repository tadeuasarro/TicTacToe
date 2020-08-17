#!/usr/bin/env ruby

class Game
  attr_accessor
  attr_reader

  def intialize (player1 = Player, player2 = Player, board = Board)
    @player1 = player1
    @player2 = player2
    @board = board
    @turn = 0
  end

  def round
    
  end

  def start_game
    while turn < 9
      round
    end
  end
end

class Player
end

class Board < Array
end