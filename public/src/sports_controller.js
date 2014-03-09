define(['jquery', 'sports_client', 'views/sports_view', 'views/events_view', 'views/outcomes_view'],
       function($, client, SportsView, EventsView, OutcomesView) {

  function sports() {
    client.sports().done(function(sports) {
      var view = new SportsView({collection: sports});
      view.render();
    });
    $('#outcomes').html('');
  }

  function events(sport_id) {
    sports();
    client.events(sport_id).done(function(events) {
      var view = new EventsView({collection: events});
      view.render();
    });
  }

  function outcomes(sport_id, event_id) {
    events(sport_id);
    client.outcomes(sport_id, event_id).done(function(outcomes) {
      var view = new OutcomesView({collection: outcomes});
      view.render();
    });
  }

  return {
    sports: sports,
    events: events,
    outcomes: outcomes
  };
});
