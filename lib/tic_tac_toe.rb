class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
  puts "-----------\n"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
  puts "-----------\n"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
end

def input_to_index(input)
  input = input.to_i - 1
  @index = input
end

def move(index, token="X")
  @board[index] = token
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
 index.between?(0,8) && !position_taken?(index)
end

def turn_count
  @count = 0
  @board.each do |i|
    @count +=1 if i != " "
  end
  @count
end

end
