class Trackwane.Views.Realtime.GeofenceAlarms.Listing extends Trackwane.Core.Framework.View

  template_id: "#geofence-alarm-listing-template"

  events:
    "click .remove": "onRemove"
    "click .select": "onSelect"

  initialize: (options) ->
    super(options)

  onRemove: (evt) ->
    if confirm("Are you sure you want to delete this geofence alarm?")
      @pubsub.trigger("geofence-alarm:deleted", $(evt.currentTarget).data("id"))
    false

  onSelect: (evt) ->
    @pubsub.trigger("geofence-alarm:selected", $(evt.currentTarget).data("id"))
    false

  render: (alarms) ->
    @$el.html(@template(alarms))
