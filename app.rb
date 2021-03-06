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
require './app/helpers/helpers'
require './sports_api'

class Application < Sinatra::Base
  set :public_folder, 'public'

  use LocaleMiddleware
  use SportsApi

  helpers do
    include Helpers
  end

  configure :development do
    register Sinatra::Reloader
  end

  before do
    @sport_list = SportList.fetch(I18n.locale)
  end

  get '/' do
    erb :index
  end

  get '/sports' do
    presenter = SportsPresenter.new(@sport_list, params)
    erb :sports, locals: presenter.sports_locals
  end

  get '/sports/:sport_id' do
    presenter = EventsPresenter.new(@sport_list, params)
    erb :events, locals: presenter.events_locals
  end

  get '/sports/:sport_id/events/:event_id' do
    presenter = OutcomesPresenter.new(@sport_list, params)
    erb :outcomes, locals: presenter.outcomes_locals
  end
end
