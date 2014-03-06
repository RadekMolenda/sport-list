class SportsApi < Sinatra::Base
  before do
    @sport_list = SportList.fetch(I18n.locale)
  end

  get '/api/sports' do
    @sport_list.ordered_sports.to_json
  end
end
