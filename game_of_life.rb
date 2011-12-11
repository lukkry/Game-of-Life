require './lib/world'
require './lib/cell'
require 'benchmark'

include Benchmark

rt = Benchmark.realtime do
  world = World.new(100, true)
  1000.times do
    world.tick!
  end
end
puts rt.to_s

# one-dimensional array
# size: 100x100
# tick: 1000
# real time: 37.090540215s
#
# two-dimensional array
# size: 100x100
# tick: 1000
# real time : 67.129922333s

