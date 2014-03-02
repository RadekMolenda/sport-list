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

  before do
    @sport_list = SportList.fetch(I18n.locale)
  end

  get '/' do
    redirect '/sports'
  end

  get '/sports' do
    @sports = SportsPresenter.new(@sport_list, params)
    erb :sports, locals: { active: -1 }
  end

  get '/sports/:sport_id' do
    @sports = EventsPresenter.new(@sport_list, params)
    erb :events, locals: { active: -1 }
  end

  get '/sports/:sport_id/events/:event_id' do
    @sports = OutcomesPresenter.new(@sport_list, params)
    erb :outcomes
  end
end
