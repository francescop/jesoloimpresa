class AddPhotosToActivities < ActiveRecord::Migration
  def self.up
  	remove_column :activities, :img1
  	remove_column :activities, :img2
  	remove_column :activities, :img3
  	remove_column :activities, :img4
  	remove_column :activities, :img5
  	remove_column :activities, :img6
  	
  	add_column :activities, :img1_file_name, :string
	add_column :activities, :img1_image_content_type, :string
	add_column :activities, :img1_image_file_size, :integer
	add_column :activities, :img1_image_updated_at, :datetime
  	
  	add_column :activities, :img2_file_name, :string
	add_column :activities, :img2_image_content_type, :string
	add_column :activities, :img2_image_file_size, :integer
	add_column :activities, :img2_image_updated_at, :datetime
	
	add_column :activities, :img3_file_name, :string
	add_column :activities, :img3_image_content_type, :string
	add_column :activities, :img3_image_file_size, :integer
	add_column :activities, :img3_image_updated_at, :datetime
	
	add_column :activities, :img4_file_name, :string
	add_column :activities, :img4_image_content_type, :string
	add_column :activities, :img4_image_file_size, :integer
	add_column :activities, :img4_image_updated_at, :datetime
	
	add_column :activities, :img5_file_name, :string
	add_column :activities, :img5_image_content_type, :string
	add_column :activities, :img5_image_file_size, :integer
	add_column :activities, :img5_image_updated_at, :datetime
	
	add_column :activities, :img6_file_name, :string
	add_column :activities, :img6_image_content_type, :string
	add_column :activities, :img6_image_file_size, :integer
	add_column :activities, :img6_image_updated_at, :datetime
  end

  def self.down
  	remove_column :activities, :img1_file_name, :string
	remove_column :activities, :img1_image_content_type, :string
	remove_column :activities, :img1_image_file_size, :integer
	remove_column :activities, :img1_image_updated_at, :datetime
  	
  	remove_column :activities, :img2_file_name, :string
	remove_column :activities, :img2_image_content_type, :string
	remove_column :activities, :img2_image_file_size, :integer
	remove_column :activities, :img2_image_updated_at, :datetime
	
	remove_column :activities, :img3_file_name, :string
	remove_column :activities, :img3_image_content_type, :string
	remove_column :activities, :img3_image_file_size, :integer
	remove_column :activities, :img3_image_updated_at, :datetime
	
	remove_column :activities, :img4_file_name, :string
	remove_column :activities, :img4_image_content_type, :string
	remove_column :activities, :img4_image_file_size, :integer
	remove_column :activities, :img4_image_updated_at, :datetime
	
	remove_column :activities, :img5_file_name, :string
	remove_column :activities, :img5_image_content_type, :string
	remove_column :activities, :img5_image_file_size, :integer
	remove_column :activities, :img5_image_updated_at, :datetime
	
	remove_column :activities, :img6_file_name, :string
	remove_column :activities, :img6_image_content_type, :string
	remove_column :activities, :img6_image_file_size, :integer
	remove_column :activities, :img6_image_updated_at, :datetime
  end
end
