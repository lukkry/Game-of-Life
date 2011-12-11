require 'sinatra'
require 'json'

get '/' do
  haml :game_of_life
end

get '/get_cells.?:format?' do
  {:a => "foo"}.to_json
end

