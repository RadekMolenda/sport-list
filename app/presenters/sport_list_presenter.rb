class SportListPresenter
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

  def events
    sport.ordered_events
  end

  def event
    sport.find_event(event_id)
  end

  def outcomes
    event.outcomes
  end

  private
  attr_reader :sport_list, :params

  def sport_id
    @sport_id ||= params.fetch("sport_id").to_i
  end

  def event_id
    @event_id ||= params.fetch("event_id").to_i
  end
end
