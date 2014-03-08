define(['backbone', 'underscore', 'text!templates/sport_template.html'], function(Backbone, _, sportTemplate) {
  return Backbone.View.extend({
    tagName: 'li',
    template: _.template(sportTemplate),

    render: function () {
      this.$el.html(this.template(this.model));
      return this;
    }
  });
});
