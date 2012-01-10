require 'sinatra'
require 'sinatra/reloader'
require 'json'

Dir[File.expand_path("../lib/**/*.rb")].each {|f| require f}
Dir[File.expand_path("lib/**/*.rb")].each {|f| require f}

configure do
  enable :sessions unless test?

  Mongoid.configure do |config|
    name = "game_of_life"
    host = "localhost"
    config.master = Mongo::Connection.new.db(name)
    config.slaves = [
      Mongo::Connection.new(host, 27017).db(name)
    ]
    config.persist_in_safe_mode = false
  end
end

get '/' do
  @width = params[:width] || 60 
  @height = params[:height] || 30
  @timespan = params[:timespan] || 500

  world = World.new(@width, @height, nil, true)
  game = Game.new(:board => world.binary_board, :width => @width, :height => @height)
  if game.save
    session[:game_id] = game.id.to_s
  end
  haml :game_of_life, :format => :html5
end

post "/board" do
  game = Game.find(session[:game_id]) 
  if game
    game.tick!
    game.board.to_json
  end
end

