# ./spec/tictactoe_spec.rb
require './lib/board.rb'
require './lib/player.rb'
require './lib/game.rb'

# BOARD CLASS
describe Board do
  describe '#take_position' do
    it "Sets the first player's token (X) to the selected cell" do
      board = Board.new
      (1..9).each do |i|
        expect(board.take_position(i, 'X')).to eql('X')
      end
    end

    it "Sets the second player's token (0) to the selected cell" do
      board = Board.new
      (1..9).each do |i|
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
    it 'Checks if the selected cell from 1 to 9 is contained in the board' do
      (1..9).each do |i|
        expect(game.check_position(i, board)).to eql(true)
      end
    end

    it 'Checks if the selected cell (10) is contained in the board' do
      expect(game.check_position(10, board)).to eql(false)
    end

    it "Checks if the selected cell ('X') is contained in the board" do
      expect(game.check_position('X', board)).to eql(false)
    end
  end

  describe '#check_victory' do
    # horizontal
    it 'Checks if the first row has a winning condition' do
      board = Board['X', 'X', 'X', 4, 5, 6, 7, 8, 9]
      expect(game.check_victory('X', board)).to eql(true)
    end
    it 'Checks if the second row has a winning condition' do
      board = Board[1, 2, 3, 'X', 'X', 'X', 7, 8, 9]
      expect(game.check_victory('X', board)).to eql(true)
    end
    it 'Checks if the third row has a winning condition' do
      board = Board[1, 2, 3, 4, 5, 6, 'X', 'X', 'X']
      expect(game.check_victory('X', board)).to eql(true)
    end
    # vertical
    it 'Checks if the first column has a winning condition' do
      board = Board['X', 2, 3, 'X', 5, 6, 'X', 8, 9]
      expect(game.check_victory('X', board)).to eql(true)
    end
    it 'Checks if the second column has a winning condition' do
      board = Board[1, 'X', 3, 4, 'X', 6, 7, 'X', 9]
      expect(game.check_victory('X', board)).to eql(true)
    end
    it 'Checks if the third column has a winning condition' do
      board = Board[1, 2, 'X', 4, 5, 'X', 7, 8, 'X']
      expect(game.check_victory('X', board)).to eql(true)
    end
    # diagonal
    it 'Checks if the ascending diagonal has a winning condition' do
      board = Board[1, 2, 'X', 4, 'X', 6, 'X', 8, 9]
      expect(game.check_victory('X', board)).to eql(true)
    end
    it 'Checks if the descending diagonal has a winning condition' do
      board = Board['X', 2, 3, 4, 'X', 6, 7, 8, 'X']
      expect(game.check_victory('X', board)).to eql(true)
    end
    # random checking
    it 'Check if some random cells marked create a winning condition' do
      board = Board['X', 'X', 3, 4, 'X', 'X', 'X', 8, 9]
      expect(game.check_victory('X', board)).to eql(false)
    end
    it 'Check if some random cells marked create a winning condition' do
      board = Board['X', 2, 3, 4, 'X', 6, 'X', 8, 9]
      expect(game.check_victory('X', board)).to eql(false)
    end
    it 'Check if some random cells marked create a winning condition' do
      board = Board[1, 2, 'X', 4, 'X', 6, 7, 8, 'X']
      expect(game.check_victory('X', board)).to eql(false)
    end
  end

  describe '#check_win_move' do
    it 'Checks if the player has a chance to win within the next move' do
      board = Board['X', 'X', 3, 4, 5, 6, 7, 8, 9]
      expect(game.check_win_move('X', board)).to eql(true)
    end
    it 'Checks if the player has a chance to win within the next move' do
      board = Board[1, 'X', 3, 4, 'X', 6, 7, 8, 9]
      expect(game.check_win_move('X', board)).to eql(true)
    end
    it 'Checks if the player has a chance to win within the next move' do
      board = Board['X', 'X', '0', 4, 5, 6, 7, 8, 9]
      expect(game.check_win_move('X', board)).to eql(false)
    end
    it 'Checks if the player has a chance to win within the next move' do
      board = Board['X', 2, 3, 4, 'X', 6, 7, 8, 9]
      expect(game.check_win_move('X', board)).to eql(true)
    end
    it 'Checks if the player has a chance to win within the next move' do
      board = Board['X', 2, 3, 4, 'X', 6, 7, 8, '0']
      expect(game.check_win_move('X', board)).to eql(false)
    end
  end
end
