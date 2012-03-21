App.Views.Realtime.FollowActionPanel = App.Views.Base.extend({

  initialize: function(options) {
    this.pubsub = options.pubsub;
    this.template = Handlebars.compile($("#follow-panel-template").html());
  },

  render: function() {
    this.$el.html(this.template);
  }

});