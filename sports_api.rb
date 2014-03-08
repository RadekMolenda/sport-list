require './app/presenters/events_api_presenter'

class SportsApi < Sinatra::Base
  before do
    @sport_list = SportList.fetch(I18n.locale)
  end

  get '/api/sports' do
    @sport_list.ordered_sports.to_json
  end

  get '/api/sports/:sport_id' do
    EventsAPIPresenter.new(@sport_list, params).events
  end

  get '/api/sports/:sport_id/events/:event_id' do
    OutcomesPresenter.new(@sport_list, params).outcomes.to_json
  end
end
