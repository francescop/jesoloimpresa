class AddPermalinkToNews < ActiveRecord::Migration
  def self.up
	add_column :news, :permalink, :string
  end

  def self.down
  end
end
