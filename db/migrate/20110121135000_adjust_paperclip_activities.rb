class AdjustPaperclipActivities < ActiveRecord::Migration
  def self.up

	rename_column :activities, :img1_image_content_type, :img1_content_type
	rename_column :activities, :img1_image_file_size, :img1_content_type
	rename_column :activities, :img1_image_updated_at, :img1_content_type
  	

	rename_column :activities, :img2_image_content_type, :img2_content_type
	rename_column :activities, :img2_image_file_size, :img2_content_type
	rename_column :activities, :img2_image_updated_at, :img2_content_type
	

	rename_column :activities, :img3_image_content_type, :img3_content_type
	rename_column :activities, :img3_image_file_size, :img3_content_type
	rename_column :activities, :img3_image_updated_at, :img3_content_type
	

	rename_column :activities, :img4_image_content_type,:img4_content_type
	rename_column :activities, :img4_image_file_size, :img4_content_type
	rename_column :activities, :img4_image_updated_at, :img4_content_type
	

	rename_column :activities, :img5_image_content_type, :img5_content_type
	rename_column :activities, :img5_image_file_size, :img5_content_type
	rename_column :activities, :img5_image_updated_at, :img5_content_type
	

	rename_column :activities, :img6_image_content_type,:img6_image_content_type
	rename_column :activities, :img6_image_file_size, :img6_image_content_type
	rename_column :activities, :img6_image_updated_at, :img6_image_content_type
  end

  def self.down
  end
end
