class Category < ActiveRecord::Base
  
  has_permalink :name, :update => true
  
  CAT_TYPES = [
      [ "Eat" , "eat" ],[ "Play" ,"play" ],[ "Live" , "live" ]
      ]
  
  has_many :activities
  
  validates_presence_of :name, :description, :category_type
  validates_uniqueness_of :name
  validates_inclusion_of :category_type, :in => CAT_TYPES.map {|disp, value| value}
  
  def to_param
    permalink
  end
  
end
