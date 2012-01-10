ENV['RACK_ENV'] = 'test'

Dir[File.expand_path("../lib/**/*.rb")].each {|f| require f}
Dir[File.expand_path("lib/**/*.rb")].each {|f| require f}

require './homepage'
require 'json'
require 'rack/test'
