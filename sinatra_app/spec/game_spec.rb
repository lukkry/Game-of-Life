require 'spec_helper'

describe Game do
  let(:world){World.new(9, 9, nil, true)}
  let(:game){Game.new(:board => world.binary_board, :width => 9, :height => 9)}

  it "has correct board after tick!" do
    game.tick!
    world.tick!
    game.board.should eq world.binary_board
  end
end
