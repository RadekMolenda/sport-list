define(['backbone', 'views/event_view'], function(Backbone, EventView){
  return Backbone.View.extend({
    el: '#events',

    render: function () {
      _.each(this.collection, function(event) {
        var view = new EventView({model: event});
        this.$el.append(view.render().el);
      }.bind(this));

      return this;
    }
  });
});
