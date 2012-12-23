class SitoController < ApplicationController
  def index
    @site_categories = Category.find(:all)
    @site_activities = Activity.find(:all)
    @site_news = News.find(:all, :limit => 5)
    @site_news_fade = News.find(:all, :limit => 6)
    @site_banner = Activity.find(:all,:conditions => ["banner = ?", true],:order=> "peso")
    @banners = Banner.find(:all, :limit => 2)

    respond_to do |format|
      format.html # index.html.erb
      format.iphone {render :layout => true}
      format.xml  { render :xml => @categories }
    end
  end
    
  def contatti
      @meta_title = "Contatti"
      @meta_keywords = "contatti jesoloimpresa"
      @meta_description = ""
  end
  
  def servizi
    @meta_title = "Servizi"
    @meta_keywords = "servizi jesoloimpresa"
    @meta_description = ""
  end
  
  def chisiamo
    @meta_title = "Chi Siamo"
    @meta_keywords = "chi siamo jesoloimpresa"
    @meta_description = ""
  end
  
  def pubbli
    @meta_title = "Chi Siamo"
    @meta_keywords = "chi siamo jesoloimpresa"
    @meta_description = ""
  end
  
  def disclaimer
    @meta_title = "Chi Siamo"
    @meta_keywords = "chi siamo jesoloimpresa"
    @meta_description = ""
  end
  
  def privacy
    @meta_title = "Chi Siamo"
    @meta_keywords = "chi siamo jesoloimpresa"
    @meta_description = ""
  end
  
  def mobile
    @meta_title = "Mobile"
    @meta_keywords = "jesoloimpresa mobile"
    @meta_description = ""
  end
  
end
