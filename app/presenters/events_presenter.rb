class EventsPresenter < SportsPresenter
  def events
    sport.ordered_events
  end

  def events_locals
    {
      active_id: -1,
      events: events,
      sports: sports,
      sport: sport
    }
  end
end
