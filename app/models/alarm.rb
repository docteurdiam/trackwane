class Alarm < ActiveRecord::Base
  belongs_to :account, :counter_cache => true
end
