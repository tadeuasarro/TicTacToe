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

  describe '#check_position' do
  it "Checks if the selected cell from 1 to 9 is contained in the board" do
    for i in (1..9) do
      expect(game.check_position(i, board)).to eql(true)
    end
  end

  it "Checks if the selected cell (10) is contained in the board" do
    expect(game.check_position(10, board)).to eql(false)
  end

  it "Checks if the selected cell ('X') is contained in the board" do
    expect(game.check_position('X', board)).to eql(false)
  end

  describe '#check_victory' do
    #horizontal
    it "Checks if the first row has a winning condition" do
      board = Board['X', 'X', 'X', 4, 5, 6, 7, 8, 9]
      expect(game.check_victory('X', board)).to eql(true)
    end
    it "Checks if the second row has a winning condition" do
      board = Board[1, 2, 3, 'X', 'X', 'X', 7, 8, 9]
      expect(game.check_victory('X', board)).to eql(true)
    end
    it "Checks if the third row has a winning condition" do
      board = Board[1, 2, 3, 4, 5, 6, 'X', 'X', 'X']
      expect(game.check_victory('X', board)).to eql(true)
    end
  end
end