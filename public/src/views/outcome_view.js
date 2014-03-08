define(['backbone', 'underscore', 'text!templates/outcome_template.html'], function(Backbone, _, outcomeTemplate) {
  return Backbone.View.extend({
    tagName: 'li',

    template: _.template(outcomeTemplate),

    render: function () {
      this.$el.html(this.template(this.model));
      return this;
    }
  });
});
