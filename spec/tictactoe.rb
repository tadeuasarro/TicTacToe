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