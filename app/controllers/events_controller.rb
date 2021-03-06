class EventsController < ApplicationController
  before_filter :require_user, :except => [:create]

  def index
    respond_to do |format|
      format.html
      format.json do
        date = params[:date]
        device_id = params[:device_id]
        device = Device.find(device_id)
        events = device.events.where("date_trunc('day', date) = DATE '#{date}'")
        render json: events
      end
    end
  end

  def create
    data = params[:data]
		if data.instance_of? String
 			payload = Parser.new.read(data)
			event = payload[:event]
			imei_number = payload[:imei_number]
		else
			imei_number = data.delete(:imei_number)
      longitude = data.delete(:longitude)
      latitude = data.delete(:latitude)
			event = Event.new(data)
      geofactory = RGeo::Geographic::simple_mercator_factory
      event.lonlat = geofactory.point(longitude, latitude)
    end
    event.device = Device.find_by_imei_number(imei_number)
    unless event.device
      render :text => "Unable to process event from IMEI #{imei_number} as it has not been properly setup", :status => 412
      return
    end

    event.date = DateTime.now unless event.date
    success = event.save
    if success
      head :ok
    else
      render :text => event.errors
    end

  end

end
