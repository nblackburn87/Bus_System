class AddStatusColumn < ActiveRecord::Migration
  def change
    add_column :buses, :status, :string
  end
end
