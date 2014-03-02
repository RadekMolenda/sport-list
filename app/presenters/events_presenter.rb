class EventsPresenter < SportsPresenter
  def events
    sport.ordered_events
  end

  def event
    sport.find_event(event_id)
  end

  private
  def event_id
    @event_id ||= params.fetch("event_id").to_i
  end
end
