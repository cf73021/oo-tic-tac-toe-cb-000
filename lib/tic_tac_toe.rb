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

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, value = current_player)
    display_board
  else
    puts "Please enter 1-9:"
    input = gets.strip
  end
end

def turn_count
  @count = 0
  @board.each do |i|
    @count +=1 if i != " "
  end
  @count
end

def current_player
  if !turn_count.odd?
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[2]] == @board[combo[0]] && @board[combo[0]] != " "
  end
end

def full?
  @board.all? {|token| token == "X" || token == "O"}
end

def draw?
  !won? && full?
end

def over?
    draw? || won?
end

def winner
  status= won?
  if status.nil?
    nil
  else
    @board[status[0]]
  end
end

def play
  until over?
    turn
  end
  if draw?
    puts "Cat's Game!"
  elsif over?
    puts "Congratulations #{winner}!"
  end
end

end
