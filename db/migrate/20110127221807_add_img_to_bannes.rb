class AddImgToBannes < ActiveRecord::Migration
  def self.up
	add_column :banners, :img_file_name, :string
	add_column :banners, :img_content_type, :string
	add_column :banners, :img_file_size, :integer
	add_column :banners, :img_updated_at, :datetime
  end

  def self.down
  end
end
