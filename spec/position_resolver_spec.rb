require 'spec_helper'

describe PositionResolver do
  context "5x5 world" do
    it "determine adjacent neighbours position (indexes)" do
      PositionResolver.resolve(0, 5, 5).should =~ [1, 4, 5, 6, 9]  
      PositionResolver.resolve(5, 5, 5).should =~ [0, 1, 4, 6, 9, 10, 11, 14]  
      PositionResolver.resolve(9, 5, 5).should =~ [0, 3, 4, 5, 8, 10, 13, 14]  
      PositionResolver.resolve(24, 5, 5).should =~ [15, 18, 19, 20, 23]  
    end
  end

  context "10x3 world" do
    it "determine adjacent neighbours position (indexes)" do
      PositionResolver.resolve(0, 10, 3).should =~ [1, 9, 10, 11, 19]
      PositionResolver.resolve(9, 10, 3).should =~ [0, 8, 10, 18, 19]
      PositionResolver.resolve(14, 10, 3).should =~ [3, 4, 5, 13, 15, 23, 24, 25]
      PositionResolver.resolve(29, 10, 3).should =~ [10, 18, 19, 20, 28]
    end
  end
end
