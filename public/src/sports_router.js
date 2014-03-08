define(['backbone', 'sports_client', 'views/sports_view'],
       function(Backbone, client, SportsView) {

  function sports() {
    client.sports().done(function(sports) {
      var view = new SportsView({collection: sports});
      view.render();
    });
  };

  return Backbone.Router.extend({
    routes : {
      '': "sports",
      'sports/:sport_id' : "events",
      'sports/:sport_id/events/:event_id': "outcomes"
    },

    sports: sports,

    events: function (sport_id) {
      client.events(sport_id).done(function(sports) { console.log(sports); });
    },

    outcomes: function (sport_id, event_id) {
      client.events(sport_id).done(function(sports) { console.log(sports); });
      client.outcomes(sport_id, event_id).done(function(outcomes) {console.log(outcomes); });
    }
  });
});
