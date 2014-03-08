define(['backbone', 'views/outcome_view'], function(Backbone, OutcomeView){
  return Backbone.View.extend({
    el: '#outcomes',

    render: function () {
      _.each(this.collection, function(outcome) {
        var view = new OutcomeView({model: outcome});
        this.$el.append(view.render().el);
      }.bind(this));

      return this;
    }
  });
});
