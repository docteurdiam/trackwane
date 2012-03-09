# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120303122737) do

  create_table "accounts", :force => true do |t|
    t.column "name", :string
    t.column "email", :string
    t.column "contact", :string
    t.column "telephone", :string
    t.column "devices_count", :integer, :default => 0
    t.column "places_count", :integer, :default => 0
    t.column "users_count", :integer, :default => 0
    t.column "geofences_count", :integer, :default => 0
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "devices", :force => true do |t|
    t.column "account_id", :integer
    t.column "imei_number", :string
    t.column "display_name", :string
    t.column "group_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "events", :force => true do |t|
    t.column "device_id", :integer
    t.column "status_code", :integer
    t.column "latitude", :decimal
    t.column "longitude", :decimal
    t.column "speed", :decimal
    t.column "address", :string
    t.column "heading", :decimal
    t.column "gps_signal", :boolean
    t.column "place_id", :integer
    t.column "date", :datetime
    t.column "distance_delta", :decimal
  end

  create_table "geofence_alarms", :force => true do |t|
    t.column "account_id", :integer
    t.column "category", :string
    t.column "name", :string
    t.column "geofence_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "geofence_warnings", :force => true do |t|
    t.column "event_id", :integer
    t.column "geofence_alarm_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "geofences", :force => true do |t|
    t.column "name", :string
    t.column "coordinates", :text
    t.column "account_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "groups", :force => true do |t|
    t.column "name", :string
    t.column "device_count", :integer
    t.column "account_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "places", :force => true do |t|
    t.column "name", :string, :null => false
    t.column "category", :string, :null => false
    t.column "longitude", :decimal, :null => false
    t.column "latitude", :decimal, :null => false
    t.column "account_id", :integer, :null => false
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "reports", :force => true do |t|
    t.column "account_id", :integer
    t.column "measure", :string
    t.column "name", :string
    t.column "devices", :string
    t.column "daterange", :string
    t.column "to", :datetime
    t.column "from", :datetime
  end

  create_table "roads", :force => true do |t|
    t.column "label", :string
    t.column "country_id", :integer
    t.column "the_geom", :geometry, :srid => nil
    t.column "route_parameters", :string, :limit => 100
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string, :null => false
    t.column "data", :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "speed_alarms", :force => true do |t|
    t.column "account_id", :integer
    t.column "speed", :decimal
    t.column "name", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "speed_warnings", :force => true do |t|
    t.column "event_id", :integer
    t.column "speed_alarm_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "tracks", :force => true do |t|
    t.column "device_id", :integer
    t.column "status_code", :integer
    t.column "latitude", :decimal
    t.column "longitude", :decimal
    t.column "speed", :decimal
    t.column "address", :string
    t.column "imei_number", :string
    t.column "heading", :decimal
    t.column "alarm_id", :integer
    t.column "date", :datetime
  end

  create_table "users", :force => true do |t|
    t.column "login", :string, :null => false
    t.column "email", :string, :null => false
    t.column "account_id", :integer
    t.column "crypted_password", :string, :null => false
    t.column "password_salt", :string, :null => false
    t.column "persistence_token", :string, :null => false
    t.column "last_login_at", :datetime
    t.column "last_login_ip", :string
    t.column "role", :string, :default => "administrator", :null => false
    t.column "status", :string, :default => "active", :null => false
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

end
