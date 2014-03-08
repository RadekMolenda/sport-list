define(['backbone', 'sports_client', 'views/sports_view', 'views/events_view'],
       function(Backbone, client, SportsView, EventsView) {

  function sports() {
    client.sports().done(function(sports) {
      var view = new SportsView({collection: sports});
      view.render();
    });
  };

  function events(sport_id) {
    client.events(sport_id).done(function(sports) {
      var view = new EventsView({collection: sports});
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

    outcomes: function (sport_id, event_id) {
      client.events(sport_id).done(function(sports) { console.log(sports); });
      client.outcomes(sport_id, event_id).done(function(outcomes) {console.log(outcomes); });
    }
  });
});
