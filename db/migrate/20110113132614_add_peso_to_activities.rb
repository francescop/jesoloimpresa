class AddPesoToActivities < ActiveRecord::Migration
  def self.up
    add_column :activities, :peso, :integer
    add_column :activities, :banner, :boolean
  end

  def self.down
    remove_column :activities, :banner
    remove_column :activities, :peso
  end
end
