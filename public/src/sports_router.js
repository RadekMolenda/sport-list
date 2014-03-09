define(['jquery', 'backbone', 'sports_client', 'views/sports_view', 'views/events_view', 'views/outcomes_view'],
       function($, Backbone, client, SportsView, EventsView, OutcomesView) {

  return function(options){
    return Backbone.Router.extend({
      routes : {
        '': "sports",
        'sports/:sport_id' : "events",
        'sports/:sport_id/events/:event_id': "outcomes"
      },

      sports: options.sports,

      events: options.events,

      outcomes: options.outcomes
    });
  };
});
