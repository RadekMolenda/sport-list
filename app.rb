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
require './app/presenters/sports_presenter'
require './app/presenters/events_presenter'
require './app/presenters/outcomes_presenter'

class Application < Sinatra::Base
  use LocaleMiddleware

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/sports'
  end

  get '/sports' do
    @sport_list = SportsPresenter.new(SportList.fetch(I18n.locale), params)
    erb :sports, locals: { active: -1 }
  end

  get '/sports/:sport_id' do
    @sport_list = EventsPresenter.new(SportList.fetch(I18n.locale), params)
    erb :sport, locals: { active: -1 }
  end

  get '/sports/:sport_id/events/:event_id' do
    @sport_list = OutcomesPresenter.new(SportList.fetch(I18n.locale), params)
    erb :outcomes
  end
end
