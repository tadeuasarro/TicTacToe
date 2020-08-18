# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
class Game
  attr_accessor :turn, :board
  attr_reader :player1, :player2

  def initialize(player1 = Player, player2 = Player, board = Board)
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
    puts 'YOU CAN WIN THIS!!!!!' if win_pos
    print "#{@player1.name} (#{@player1.token}): " if @turn.odd?
    print "#{@player2.name} (#{@player2.token}): " if @turn.even?
    puts 'Which position to take?'
    input = gets.chomp.to_i
    if @board.include?(input)
      @board[input - 1] = @player1.token if @turn.odd?
      @board[input - 1] = @player2.token if @turn.even?
    else
      @turn -= 1
      puts 'Invalid play! Try again!'
    end
  end

  def check_position(pos, board)
    board.include?(pos) ? ans = true : ans = false
    ans
  end

  def check_victory(token, board)
    counters = [0, 0, 0, 0] # [cols,rows,diag1,diag2]
    (0..2).each do |i|
      counters[0] = [board[i], board[i + 3], board[i + 6]].count(token) # Checks the positions for the columns
      counters[1] = [board[i * 3], board[(i * 3) + 1], board[(i * 3) + 2]].count(token)
      counters[2] += 1 if board[i * 4] == token # Counts if a position in the main diagonal
      counters[3] += 1 if board[(i * 2) + 2] == token # Counts if a position in the oposite diagonal
      return true if counters.include? 3
    end
    false
  end

  def check_win_move(token, board)
    diag1 = []
    diag2 = []

    (0..2).each do |i|
      col = [board[i], board[i + 3], board[i + 6]] # Gets the whole column
      row = [board[i * 3], board[(i * 3) + 1], board[(i * 3) + 2]] # Gets the whole row
      diag1.push(board[i * 4]) # Starts constructing the main diagonal
      diag2.push(board[(i * 2) + 2]) # Starts constructing the oposite diagonal
      return true if col.count(token) == 2 && col.any?(Numeric)

      return true if row.count(token) == 2 && row.any?(Numeric)
    end
    return true if diag1.count(token) == 2 && diag1.any?(Numeric)

    return true if diag2.count(token) == 2 && diag2.any?(Numeric)

    false
  end
end
# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
