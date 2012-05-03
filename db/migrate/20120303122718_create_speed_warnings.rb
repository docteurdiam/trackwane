class CreateSpeedWarnings < ActiveRecord::Migration
  create_table :speed_warnings do |t|
    t.references :event
    t.references :alarm
    t.timestamps
  end
end
