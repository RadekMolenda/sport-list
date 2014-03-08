define(['backbone', 'views/sport_view'], function(Backbone, SportView){
  return Backbone.View.extend({
    el: '#sports',
    render: function () {
      _.each(this.collection, function(sport) {
        var view = new SportView({model: sport});
        this.$el.append(view.render().el);
      }.bind(this));

      return this;
    }
  });
});
