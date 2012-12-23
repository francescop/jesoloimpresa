class AddImgToBanner < ActiveRecord::Migration
  def self.up

	remove_column :banners, :img_updated_at
	remove_column :banners, :img_file_size
	remove_column :banners, :img_content_type
	remove_column :banners, :img_file_name

	add_column :banners, :img_file_name, :string
        add_column :banners, :img_content_type, :string
        add_column :banners, :img_file_size, :integer
        add_column :banners, :img_updated_at, :datetime


  end

  def self.down
  end
end
