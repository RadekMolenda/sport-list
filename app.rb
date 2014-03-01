require 'sinatra'
require 'catcher'
require 'id'
require './lib/sports_dao'
require './app/models/outcome'
require './app/models/event'
require './app/models/sport'
require './app/models/sport_list'

class Application < Sinatra::Base
  get '/sports' do
    sport_list = SportList.fetch
    @sports = sport_list.sports
    erb :sports
  end
end
