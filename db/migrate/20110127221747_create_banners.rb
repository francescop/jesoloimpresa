class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :title
      t.string :url
      t.string :alt

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
