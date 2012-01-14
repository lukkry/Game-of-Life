module PositionResolver

  # determine adjacent neighbours position
  # and return array of their indexes
  def self.resolve(current_pos, world_width, world_height)
    row = current_pos / world_width
    col = current_pos % world_width
    indexes = []

    [:top, :middle, :bottom].each do |line|
      if line == :top
        next if row <= 0
        indexes += resolve_top(current_pos, col, world_width)
      elsif line == :bottom
        next if row >= world_height - 1
        indexes += resolve_bottom(current_pos, col, world_width)
      elsif line == :middle
        indexes += resolve_middle(current_pos, col, world_width)
      end
    end
    indexes
  end

  private

  def self.resolve_top(current_pos, col, world_width)
    if col == 0
      [current_pos - world_width, current_pos - world_width + 1, current_pos - 1]
    elsif col == world_width - 1
      [current_pos - world_width, current_pos - world_width - 1, current_pos - (2 * world_width) + 1]
    else
      [current_pos - world_width, current_pos - world_width - 1, current_pos - world_width + 1]
    end
  end

  def self.resolve_bottom(current_pos, col, world_width)
    if col == 0
      [current_pos + world_width, current_pos + world_width + 1, current_pos + (2 * world_width) - 1]
    elsif col == world_width - 1
      [current_pos + world_width, current_pos + world_width - 1, current_pos + 1]
    else
      [current_pos + world_width, current_pos + world_width - 1, current_pos + world_width + 1]
    end
  end

  def self.resolve_middle(current_pos, col, world_width)
    if col == 0
      [current_pos + 1, current_pos + world_width - 1]
    elsif col == world_width - 1
      [current_pos - 1, current_pos - world_width + 1]
    else
      [current_pos - 1, current_pos + 1]
    end
  end
end
