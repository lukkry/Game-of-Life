require 'spec_helper'

describe World do
  let(:world){World.new}

  it "kill live cell with fewer than two live neighbours" do
    world.alive_cells([0, 0], [2, 2])
    world.tick!
    world.alive_cells_count.should == 0 
    world[0, 0].should be_dead
  end

  it "safe live cell with two or three live neighbours" do
    world.alive_cells([0, 0], [1, 1], [2, 2])
    world.tick!
    world.alive_cells_count.should == 3 
    world[1, 0].should be_alive
    world[1, 1].should be_alive
    world[1, 2].should be_alive
  end

  it "kill live cell with more than three live neighbours" do
    world.alive_cells([0, 0], [0, 1], [0, 2], [1, 0], [1, 1])
    world.tick!
    world[1, 1].should be_dead
  end

  it "make alive any dead cell with exactly three live neighbours" do
    world.alive_cells([0, 1], [1, 0], [1, 1])
    world.tick!
    world[0, 0].should be_alive
  end

  it "initialize with 0 alive cells" do
    world.alive_cells_count.should == 0
  end

  it "be able to initialize with specific board" do
    world = World.new(3, 3, [true, true, false, true, true, false, false, false, false])
    world[0, 0].should be_alive
    world[0, 1].should be_alive
    world[0, 2].should be_dead
    world[1, 0].should be_alive
    world[1, 1].should be_alive
  end

  context "oscillators" do
    it "behave like a blinker" do
      world = World.new(5, 5)
      blinker_cells = [[2, 1], [2, 2], [2, 3]]
      blinker_cells.each{|c| world.alive_cell(c)}

      world.tick!
      world.alive_cells_count.should == 3
      world[1, 2].should be_alive
      world[3, 2].should be_alive

      world.tick!
      world.alive_cells_count.should == 3
      blinker_cells.each do |cell|
        world[cell[0], cell[1]].should be_alive
      end
    end
  end

  context "still lifes" do
    it "keep the same shape" do
      world = World.new(6, 6)
      beehive_cells = [[1, 2], [1, 3], [2, 1], [2, 4], [3, 2], [3, 3]]
      beehive_cells.each{|c| world.alive_cell(c)}
      3.times{world.tick!}
      world.alive_cells_count.should == 6
      beehive_cells.each do |cell|
        world[cell[0], cell[1]].should be_alive
      end
    end
  end

end
