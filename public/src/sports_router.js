define(['backbone', 'sports_controller', 'underscore'], function(Backbone, sports_controller, _) {
  var router = {
    routes : {
      '': "sports",
      'sports/:sport_id' : "events",
      'sports/:sport_id/events/:event_id': "outcomes"
    }
  };

  return Backbone.Router.extend(_.extend(router, sports_controller));
});
