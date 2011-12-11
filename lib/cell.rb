class Cell
  attr_accessor :live, :world, :pos, :row_index, :col_index

  def initialize(world, pos, live = false)
    @live = live 
    @pos = pos
    @world = world
    @row_index = @pos / @world.size
    @col_index = @pos % @world.size
  end

  def alive?
    @live
  end

  def dead?
    !alive?
  end

  def alive!
    @live = true
  end

  # Return number of alive neighbours
  # world board is considered as cylinder, 
  # so left edge is connect with right edge
  # (that means that in the same row first and last cell are neighbours)
  def neighbours_count
    row_neighbours_count(:top) + row_neighbours_count(:middle) + row_neighbours_count(:bottom)
  end

  private 

  def row_neighbours_count(row_pos)
    if row_pos == :top
      return 0 if @row_index <= 0
      start_index = (@row_index - 1) * @world.size
      c_pos = [@col_index - 1, @col_index, @col_index + 1]
    elsif row_pos == :bottom
      return 0 if @row_index >= @world.size - 1
      start_index = (@row_index + 1) * @world.size 
      c_pos = [@col_index - 1, @col_index, @col_index + 1]
    elsif row_pos == :middle
      start_index = @row_index * @world.size
      c_pos = [@col_index - 1, @col_index + 1]
    end

    counter = 0 
    end_index = start_index + @world.size - 1
    n = @world[start_index..end_index]
    c_pos.each do |i|
      i -= @world.size if i >= @world.size
      counter += 1 if n[i].alive?
    end
    counter
  end
end
