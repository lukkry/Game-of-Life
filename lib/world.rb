class World 
  attr_accessor :board, :width, :height

  def initialize(width = 3, height = 3, init_board = nil)
    @width = width.to_i
    @height = height.to_i
    @board = Array.new(@width * @height)

    # init board with dead cells
    @board.each_with_index{|cell, index| @board[index] = Cell.new(self, index)} 

    #init board with specific state
    if init_board
      init_board.each_with_index do |cell, index|
        @board[index].alive! if cell == true || cell == 1 
      end
    end
  end

  def randomize!
    @board.each{|cell| cell.alive! if rand < 0.5}
  end

  def size
    @width * @height 
  end

  def [](x, y = nil)
    return @board[x] if x.is_a? Range
    i = y ? transform_xy_to_x(x, y) : x
    @board[i]
  end

  # return board as as binary array, 
  # example: [0, 1, 0, 1]
  def binary_board
    @board.collect{|c| c.alive? ? 1 : 0}
  end

  def alive_cells(*cells)
    cells.each do |cell|
      self[cell[0], cell[1]].alive!
    end
  end

  def tick!
    new_board = Array.new(@width * @height)
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

  # transform two dimensional Array notation into one dimensional
  def transform_xy_to_x(x, y)
    (x * @width) + y
  end

end
