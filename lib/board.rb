class Board < Array
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def take_position(pos, token)
    @board[pos - 1] = token
  end

  def display_board
    print "\n\t---------------\n\t"
    @board.each_with_index do |item, i|
      print "| #{item} |"
      print "\n\t---------------\n\t" if ((i + 1) % 3).zero?
    end
    print "\n"
  end
end
