# ./spec/tictactoe_spec.rb
require './lib/board.rb'
require './lib/player.rb'
require './lib/game.rb'

# BOARD CLASS
describe Board do
  describe '#take_position' do
    it "Sets the first player's token (X) to the selected cell" do
      board = Board.new
      for i in (1..9) do
        expect(board.take_position(i, 'X')).to eql('X')
      end
    end

    it "Sets the second player's token (0) to the selected cell" do
      board = Board.new
      for i in (1..9) do
        expect(board.take_position(i, '0')).to eql('0')
      end
    end

  end
end

# GAME CLASS
describe Game do
  player1 = Player.new('First', 'X')
  player2 = Player.new('Second', '0')
  board = Board[1, 2, 3, 4, 5, 6, 7, 8, 9]
  game = Game.new(player1, player2, board)
  
end