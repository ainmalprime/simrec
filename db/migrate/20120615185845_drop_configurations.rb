class DropConfigurations < ActiveRecord::Migration
  def up
  	drop_table :configurations
  end

  def down
  end
end
