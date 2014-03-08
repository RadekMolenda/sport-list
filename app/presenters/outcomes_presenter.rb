class OutcomesPresenter < EventsPresenter
  def outcomes
    event.outcomes
  end

  def event
    sport.find_event(event_id)
  end

  def outcomes_locals
    {
      events: events,
      event: event,
      sports: sports,
      sport: sport,
      outcomes: outcomes
    }
  end

  private
  def event_id
    @event_id ||= params.fetch("event_id").to_i
  end
end
