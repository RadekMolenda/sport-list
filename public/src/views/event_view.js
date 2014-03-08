define(['backbone', 'underscore', 'text!templates/event_template.html'], function(Backbone, _, eventTemplate) {
  return Backbone.View.extend({
    tagName: 'li',

    template: _.template(eventTemplate),

    render: function () {
      this.$el.html(this.template(this.model));
      return this;
    }
  });
});
