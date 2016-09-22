require_relative "board"
class Hanoi
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def get_input
    puts "Enter an index to take a disk from, follow by a
    comma and an index to move the disk to"
    input = gets.chomp
    if !check_input(input)
      raise ("Your input is incorrect")
    end
    input.split(",").map { |el| el.to_i }
  end

  def play_game
    until @board.won?
      input = get_input
      @board.move(input.first, input.last)
    end
    puts "You won!"
  end

  def check_input(input)
    if @board.valid_move?(input[0].to_i, input[1].to_i)
      return true
    else
      false
    end
  end

end

board = Board.new
hanoi = Hanoi.new(board)
hanoi.play_game
