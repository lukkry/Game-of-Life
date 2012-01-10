require 'spec_helper'

describe 'Game of Life' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # init game for user and set game id in session
  before :each do
    Game.destroy_all
    session = {}
    get '/', {:width => 10, :height => 10}, 'rack.session' => session
    game = Game.first
    session[:game_id].should eq game.id.to_s
    game.width.should eq 10
    game.height.should eq 10
  end

  it 'tick game and return board' do
    game = Game.first
    post 'board', {}, 'rack.session' => {:game_id => game.id.to_s}
    json = JSON.parse(last_response.body)
    json.should be_a(Array)
    json.size.should eq game.board.size
    last_response.should be_ok
  end
end
