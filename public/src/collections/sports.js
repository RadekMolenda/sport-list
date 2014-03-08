define(['Backbone', '/src/models/sport'], function(Backbone, Sport){
  return Backbone.Collection.extend({
    url: '/api/sports',
    model: Sport
  });
});
