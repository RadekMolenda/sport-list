require 'sinatra'
require 'sinatra/reloader'
require 'catcher'
require 'id'
require 'i18n'
require 'i18n/backend/fallbacks'
require './lib/sports_dao'
require './app/models/outcome'
require './app/models/event'
require './app/models/sport'
require './app/models/sport_list'

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  configure do
    I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
    I18n.load_path += Dir[File.join(settings.root, 'locales', '*.yml')]
    I18n.backend.load_translations
  end

  before do
    session[:locale] ||= 'en'
    I18n.locale = session[:locale]
    @locales = ['en', 'it', 'he']

    @sport_list = SportList.fetch(I18n.locale)
    @sports = @sport_list.ordered_sports
  end

  ['/sports/:sport_id', '/sports/:sport_id/events/:event_id'].each do |path|
    before path do
      @sport = @sport_list.find_sport(params[:sport_id].to_i)
      @events = @sport.ordered_events
    end
  end

  get '/' do
    redirect '/sports'
  end

  get '/sports' do
    erb :sports, locals: { active: -1 }
  end

  get '/sports/:sport_id' do
    erb :sport, locals: { active: -1 }
  end

  get '/sports/:sport_id/events/:event_id' do
    @event = @sport.find_event(params[:event_id].to_i)
    @outcomes = @event.outcomes
    erb :outcomes
  end

  get '/set_locale/:locale' do
    session[:locale] = params[:locale] if @locales.detect{ |locale| locale == params[:locale] }
    redirect "/sports"
  end

end
