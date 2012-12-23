class AddPhotosToNews < ActiveRecord::Migration
def self.up
 	remove_column :news, :big_image
	add_column :news, :big_image_file_name, :string
	add_column :news, :big_image_content_type, :string
	add_column :news, :big_image_file_size, :integer
	add_column :news, :big_image_updated_at, :datetime
end

  def self.down
    remove_column :big_image
  end

end
