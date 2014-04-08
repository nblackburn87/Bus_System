class Station < ActiveRecord::Base
  has_many :lines, through: :stops
  has_many :stops
  has_many :schedules
end
