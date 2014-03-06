class SportsApi < Sinatra::Base
  before do
    @sport_list = SportList.fetch(I18n.locale)
  end

  get '/api/sports' do
    @sport_list.ordered_sports.to_json
  end

  get '/api/sports/:sport_id' do
    EventsPresenter.new(@sport_list, params).events.to_json
  end
end
