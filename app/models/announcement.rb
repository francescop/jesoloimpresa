class Announcement < ActiveRecord::Base
    
  belongs_to :announcementcategory
  
  has_attached_file :image1, :styles => { :big => "195x295>", :medium => "95x115>", :thumb => "45x55>" }
  has_attached_file :image2, :styles => { :big => "195x295>", :medium => "95x115>", :thumb => "45x55>" }
  has_attached_file :image3, :styles => { :big => "195x295>", :medium => "95x115>", :thumb => "45x55>" }
  
  before_create :deactivate
  
  has_permalink :titolo, :update => true
  
  validates_presence_of :titolo, :announcementcategory_id, :comune, :offrocerco, :descrizione, :email
  validates_uniqueness_of :titolo, :scope => :announcementcategory_id
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    
  def to_param
    permalink
  end
    
  def deactivate
    self.attivo = 'false' unless self.attivo
  end
  
end
