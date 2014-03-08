define(['backbone', 'sports_client'], function(Backbone, client) {
  return Backbone.Router.extend({
    routes : {
      '': "sports",
      'sports/:sport_id' : "events",
      'sports/:sport_id/events/:event_id': "outcomes"
    },
    sports: function () {
      client.sports().done(function(sports) { console.log(sports); });
    },
    events: function (sport_id) {
      client.sports().done(function(sports) { console.log(sports); });
      client.events(sport_id).done(function(sports) { console.log(sports); });
    },
    outcomes: function (sport_id, event_id) {
      client.sports().done(function(sports) { console.log(sports); });
      client.events(sport_id).done(function(sports) { console.log(sports); });
      client.outcomes(sport_id, event_id).done(function(outcomes) {console.log(outcomes); });
    }
  });
});
