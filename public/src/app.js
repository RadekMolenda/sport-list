define(['backbone', 'sports_client', 'sports_router'],
       function(Backbone, client, Router) {
  return {
    start: function () {
      window.client = client;
      new Router();
      Backbone.history.start();
    }
  };
});
