Dir[File.expand_path("lib/**/*.rb")].each {|f| require f}
require 'ruby-prof'

world = World.new(60, 30, nil, true)
100.times{world.tick!}

