class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.column :bus_id, :integer
      t.column :station_id, :integer
      t.column :arrival_time, :time

      t.timestamps
    end
  end
end
