require 'spec_helper'

describe Cell do
  let(:world){World.new}
  let(:cell){Cell.new(world, 0)}

  it "be initialized as dead cell" do
    cell.should be_dead
  end

  context "utility methods" do
    it "#alive! should alive cell" do
      cell.alive!
      cell.should be_alive
    end

    it "#neighbours_count should return the most adjacent neighbours count" do
      world = World.new(10, 3)

      world[0, 0].alive!
      world[0, 1].alive!
      world[1, 0].alive!
      world[1, 9].alive!
      world[2, 9].alive!

      world[0, 0].neighbours_count.should == 3 
      world[0, 1].neighbours_count.should == 2  
      world[1, 0].neighbours_count.should == 4 
      world[1, 1].neighbours_count.should == 3
      world[1, 9].neighbours_count.should == 3
      world[2, 9].neighbours_count.should == 2
    end
  end

end

