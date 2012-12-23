class CreateAnnouncementcategories < ActiveRecord::Migration
  def self.up
    create_table :announcementcategories do |t|
      t.string :name
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :announcementcategories
  end
end
