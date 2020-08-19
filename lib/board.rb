class Board < Array
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def take_position(pos, token)
    @board[pos - 1] = token
  end

end
