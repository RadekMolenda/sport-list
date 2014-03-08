define(['Backbone'], function(Backbone) {
  return Backbone.Model.extend({
    defaults: {
      description: "",
      market: "",
      price: ""
    }
  });
});
