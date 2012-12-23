class ApplicationController < ActionController::Base
  protect_from_forgery

# togli il true quando il sito è in produzione,
# serve per mostrare il sito per iphone  
  acts_as_iphone_controller()

  before_filter :find_category_type, :start_method, :meta_defaults, :set_iphone_format
  
    def set_iphone_format
      if is_iphone_request? 
        request.format = :iphone
      end
    end

  @banner = Banner.find(:all, :order => 'random()', :limit => 1)

  helper_method :admin?
  
  def start_method
    @search = Activity.search(params[:search])
  end
  
  def find_category_type
    @cat_type_eat = trovatipo('eat') #Category.find(:all, :conditions => { :category_type => 'eat' })
    @cat_type_play = trovatipo('play') #Category.find(:all, :conditions => { :category_type => 'play' })
    @cat_type_live = trovatipo('live') #Category.find(:all, :conditions => { :category_type => 'live' })
  end
  
  private
  def trovatipo(type)
    requested_type = Category.find(:all, :conditions => { :category_type => type }, :order => 'random()', :limit => 5)
    return requested_type
  end
  
  def meta_defaults
    @meta_title = "Home page"
    @meta_keywords = "le mie parole chiave"
    @meta_description = "il mio meta description"
  end
  
  protected
  
  def authorize
    unless admin?
      flash[:notice]= "Not authorized."
      redirect_to :action => :index
      false
    end
  end
  
  def admin?
    session[:password] == "jimpresa2011j"
  end
  
 
  
end
