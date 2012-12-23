class AddTelandwebToActivities < ActiveRecord::Migration
  def self.up
    add_column :activities, :phone, :string
    add_column :activities, :website, :string
  end

  def self.down
    remove_column :activities, :website
    remove_column :activities, :phone
  end
end
