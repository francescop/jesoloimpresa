class AddExpiredateToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :expiredate, :datetime
  end

  def self.down
    remove_column :activities, :expiredate
  end
end
