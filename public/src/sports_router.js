define(['backbone', 'sports_client', 'views/sports_view', 'views/events_view', 'views/outcomes_view'],
       function(Backbone, client, SportsView, EventsView, OutcomesView) {

  function sports() {
    client.sports().done(function(sports) {
      var view = new SportsView({collection: sports});
      view.render();
    });
  }

  function events(sport_id) {
    sports();
    client.events(sport_id).done(function(events) {
      var view = new EventsView({collection: events});
      view.render();
    });
  }

  function outcomes(sport_id, event_id) {
    sports();
    events(sport_id);
    client.outcomes(sport_id, event_id).done(function(outcomes) {
      var view = new OutcomesView({collection: outcomes});
      view.render();
    });
  }

  return Backbone.Router.extend({
    routes : {
      '': "sports",
      'sports/:sport_id' : "events",
      'sports/:sport_id/events/:event_id': "outcomes"
    },

    sports: sports,

    events: events,

    outcomes: outcomes
  });
});
