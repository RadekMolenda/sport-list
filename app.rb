require 'sinatra'
require 'sinatra/reloader'
require 'id'
require 'i18n'
require 'i18n/backend/fallbacks'
require './locale_middleware'
require './lib/sports_dao'
require './app/models/outcome'
require './app/models/event'
require './app/models/sport'
require './app/models/sport_list'
require './app/presenters/sport_list_presenter'

class Application < Sinatra::Base
  use LocaleMiddleware

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/sports'
  end

  get '/sports' do
    @sport_list = SportListPresenter.new(SportList.fetch(I18n.locale), params)
    @sports = @sport_list.sports
    erb :sports, locals: { active: -1 }
  end

  get '/sports/:sport_id' do
    @sport_list = SportListPresenter.new(SportList.fetch(I18n.locale), params)
    @sports = @sport_list.sports
    @events = @sport_list.events
    @sport = @sport_list.sport
    erb :sport, locals: { active: -1 }
  end

  get '/sports/:sport_id/events/:event_id' do
    @sport_list = SportListPresenter.new(SportList.fetch(I18n.locale), params)
    @sports = @sport_list.sports
    @event = @sport_list.event
    @sport = @sport_list.sport
    @events = @sport_list.events
    @outcomes = @sport_list.outcomes
    erb :outcomes
  end
end
