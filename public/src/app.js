define(['backbone', 'sports_router'], function(Backbone, Router) {
  return {
    start: function () {
      new Router();
      Backbone.history.start();
    }
  };
});
