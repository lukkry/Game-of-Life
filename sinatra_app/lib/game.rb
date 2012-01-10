require 'mongoid'

class Game 
  include Mongoid::Document

  field :board, type: Array
  field :width, type: Integer
  field :height, type: Integer

  def tick!
    world = World.new(self.width, self.height, self.board)
    world.tick!
    self.board = world.binary_board
    self.save
  end
end
