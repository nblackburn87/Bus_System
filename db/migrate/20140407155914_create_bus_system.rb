class CreateBusSystem < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :lines do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :stops do |t|
      t.column :line_id, :int
      t.column :station_id, :int

      t.timestamps
    end
  end
end
