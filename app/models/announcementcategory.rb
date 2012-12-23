class Announcementcategory < ActiveRecord::Base
  
  has_many :announcements
  
  has_permalink :name, :update => true
  
  validates_presence_of :name
  validates_uniqueness_of :name

  
  def to_param
    permalink
  end
  
end
