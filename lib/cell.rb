class Cell
  attr_accessor :live, :world, :pos

  def initialize(world, pos, live = false)
    @live = live 
    @pos = pos
    @world = world
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
    indexes = PositionResolver.resolve(pos, @world.width, @world.height)
    return indexes.select{|x| @world[x].alive?}.count
  end
end
