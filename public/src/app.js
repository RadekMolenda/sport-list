define(['backbone', 'sports_router', 'sports_controller'],
       function(Backbone, router, sports_controller) {
  return {
    start: function () {
      new (router(sports_controller))();
      Backbone.history.start();
    }
  };
});
