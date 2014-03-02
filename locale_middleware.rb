class LocaleMiddleware < Sinatra::Base
  enable :sessions

  configure do
    I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
    I18n.load_path += Dir[File.join(settings.root, 'locales', '*.yml')]
    I18n.backend.load_translations
    I18n.available_locales = ['en', 'it', 'he']
  end

  before do
    session[:locale] ||= 'en'
    I18n.locale = session[:locale]
  end

  get '/set_locale/:locale' do
    if I18n.available_locales.detect{ |locale| locale.to_s == params[:locale] }
      session[:locale] = params[:locale]
    end
    redirect "/"
  end
end

