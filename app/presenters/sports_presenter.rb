class SportsPresenter
  def initialize(sport_list, params)
    @params = params
    @sport_list = sport_list
  end

  def sports
    sport_list.ordered_sports
  end

  def sport
    sport_list.find_sport(sport_id)
  end

  def sports_locals
    {
      active_id: -1,
      sports: sports
    }
  end

  private
  attr_reader :sport_list, :params

  def sport_id
    @sport_id ||= params.fetch("sport_id").to_i
  end
end
