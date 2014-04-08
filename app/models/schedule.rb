class Schedule < ActiveRecord::Base
  belongs_to :bus
  belongs_to :station
end
