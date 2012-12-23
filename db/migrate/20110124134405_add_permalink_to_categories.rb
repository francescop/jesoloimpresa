class AddPermalinkToCategories < ActiveRecord::Migration
  def self.up
  	add_column :categories, :permalink, :string
  end

  def self.down
  end
end
