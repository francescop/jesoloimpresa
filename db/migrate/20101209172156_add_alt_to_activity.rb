class AddAltToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :altimage1, :string
    add_column :activities, :altimage2, :string
    add_column :activities, :altimage3, :string
    add_column :activities, :altimage4, :string
    add_column :activities, :altimage5, :string
    add_column :activities, :altimage6, :string
  end

  def self.down
    remove_column :activities, :altimage6
    remove_column :activities, :altimage5
    remove_column :activities, :altimage4
    remove_column :activities, :altimage3
    remove_column :activities, :altimage2
    remove_column :activities, :altimage1
  end
end
