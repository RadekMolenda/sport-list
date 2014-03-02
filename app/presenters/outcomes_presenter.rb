class OutcomesPresenter < EventsPresenter
  def outcomes
    event.outcomes
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
end
