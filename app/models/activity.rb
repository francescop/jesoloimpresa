class Activity < ActiveRecord::Base
  
  belongs_to :category
  
  has_attached_file :img1, :styles => { :medium => "300x270>", :small => "90x64>", :thumb => "125x35>" }
  has_attached_file :img2, :styles => { :medium => "300x270>", :small => "90x64>", :thumb => "125x35>" }
  has_attached_file :img3, :styles => { :medium => "300x270>", :small => "90x64>", :thumb => "125x35>" }
  has_attached_file :img4, :styles => { :medium => "300x270>", :small => "90x64>", :thumb => "125x35>" }
  has_attached_file :img5, :styles => { :medium => "300x270>", :small => "90x64>", :thumb => "125x35>" }
  has_attached_file :img6, :styles => { :medium => "300x270>", :small => "90x64>", :thumb => "125x35>" } # :medium => "405x635>"

  
  validates_presence_of :name, :address, :category_id #, :expiredate, :peso
  validates_uniqueness_of :name #, :peso, :scope => :category_id
  
  has_permalink :name, :update => true

  
  def to_param
    permalink
  end
  
end
