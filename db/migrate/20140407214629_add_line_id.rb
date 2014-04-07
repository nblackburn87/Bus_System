class AddLineId < ActiveRecord::Migration
  def change
    add_column :buses, :line_id, :int
  end
end
