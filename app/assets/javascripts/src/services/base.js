App.Views.Base = Backbone.View.extend({

  handleApplicationEvents: function() {
    if (this.appEvents) {
      var events = _.keys(this.appEvents);
      _.each(events, function(key) {
        this.pubsub.on(key, this[this.appEvents[key]].bind(this));
      }.bind(this));
    }
  }

});

App.Controllers.Base = App.Views.Base.extend({

  init: function() {
    this.pubsub = _.extend({}, Backbone.Events);
    this.handleApplicationEvents();
  }

});