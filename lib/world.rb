class World 
  attr_accessor :board, :size

  def initialize(size = 3, random = false)
    @size = size
    @board = Array.new(@size * @size)

    # init board with dead cells
    @board.each_with_index do |cell, index| 
      @board[index] = Cell.new(self, index)
    end 

    # alive random cells
    if random
      @board.each{|cell| cell.alive! if rand < 0.5}
    end
  end

  def [](x, y = nil)
    return @board[x] if x.is_a? Range
    i = y ? transform_xy_to_x(x, y) : x
    @board[i]
  end

  def alive_cell(cell)
    self[cell[0], cell[1]].alive!
  end

  def alive_cells(*cells)
    cells.each do |cell|
      self[cell[0], cell[1]].alive!
    end
  end

  def tick!
    new_board = Array.new(@size * @size)
    new_board.each_with_index do |cell, index| 
      new_board[index] = Cell.new(self, index)
    end 

    @board.each_with_index do |cell, index|
      n_c = cell.neighbours_count
      if cell.alive?
        new_board[index].alive! if n_c == 2 || n_c == 3
      else
        new_board[index].alive! if n_c == 3
      end
    end

    @board = new_board.dup
  end

  def alive_cells_count
    @board.count{|c| c.alive?}
  end

  private 

  # transform two dimensional Array notation to one dimensional
  def transform_xy_to_x(x, y)
    (x * @size) + y
  end

end
