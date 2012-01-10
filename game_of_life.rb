Dir[File.expand_path("lib/**/*.rb")].each {|f| require f}
require 'ruby-prof'

world = World.new(5, 3, nil, true)
10.times{world.tick!}

