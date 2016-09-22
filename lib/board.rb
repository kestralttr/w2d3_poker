class Board
  attr_accessor :grid

  def initialize(grid = [[3,2,1], [], []])
    @grid = grid
  end

  def won?
    if !@grid.first.empty?
      return false
    end

    if @grid[1].empty?
      return true
    end

    if @grid.last.empty?
      return true
    end
    false
  end

  def move(from,to)
    @grid[to] << @grid[from].pop
  end

  def valid_move?(from, to)
    if @grid[from].empty?
      return false
    end

    if @grid[from].last > @grid[to].last
      return false
    end
    true 
  end


end
