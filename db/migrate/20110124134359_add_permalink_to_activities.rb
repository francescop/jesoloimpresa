class AddPermalinkToActivities < ActiveRecord::Migration
  def self.up
  	add_column :activities, :permalink, :string
  end

  def self.down
  end
end
