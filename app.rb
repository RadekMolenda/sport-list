require 'sinatra'
require 'sinatra/reloader'
require 'catcher'
require 'id'
require './lib/sports_dao'
require './app/models/outcome'
require './app/models/event'
require './app/models/sport'
require './app/models/sport_list'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/sports' do
    sport_list = SportList.fetch
    @sports = sport_list.ordered_sports
    erb :sports
  end

  get '/sports/:sport_id' do
    sport_list = SportList.fetch
    @sport = sport_list.find_sport(params[:sport_id].to_i)
    @events = @sport.ordered_events
    erb :sport
  end

  get '/sports/:sport_id/events/:event_id' do
    sport_list = SportList.fetch
    @sport = sport_list.find_sport(params[:sport_id].to_i)
    @event = @sport.find_event(params[:event_id].to_i)
    @outcomes = @event.outcomes
    erb :outcomes
  end

end
