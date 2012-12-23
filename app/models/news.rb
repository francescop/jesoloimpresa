class News < ActiveRecord::Base
	has_attached_file :big_image, :styles => { :medium => "405x635>", :thumb => "100x100>" }
  has_permalink :title, :update => true

  
  def to_param
    permalink
  end

end
