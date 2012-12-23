class Banner < ActiveRecord::Base
  has_attached_file :img, :styles => { :medium => "300x245>", :thumb => "100x100>", :small => "300x135>", :div_annunci => "195x400>" }
  validates_presence_of :title, :alt, :url
end
