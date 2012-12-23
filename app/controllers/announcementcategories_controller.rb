class AnnouncementcategoriesController < ApplicationController
  # GET /announcementcategories
  # GET /announcementcategories.xml
  
  layout 'annunci'
  
  before_filter :authorize, :except => [:index, :show]
  
  def index
    @announcementcategories = Announcementcategory.all
        
    @banner = Banner.find(:all, :order => 'random()', :limit => 1)
    
    @meta_title="Jesolo Annunci"
    @meta_keywords=""
    @meta_description=""

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @announcementcategories }
    end
  end

  # GET /announcementcategories/1
  # GET /announcementcategories/1.xml
  def show
    @announcementcategory = Announcementcategory.find_by_permalink(params[:id])
    
    @banner = Banner.find(:all, :order => 'random()', :limit => 1)
    
    @annunci = Announcement.all(:conditions => { :attivo => true, :announcementcategory_id => @announcementcategory.id })
    @annunci_offro = Announcement.all(:conditions => { :attivo => true, :announcementcategory_id => @announcementcategory.id, :offrocerco => 'offro'  })
    @annunci_cerco = Announcement.all(:conditions => { :attivo => true, :announcementcategory_id => @announcementcategory.id, :offrocerco => 'cerco'  })
    
    @meta_title=@announcementcategory.name
    @meta_keywords=""
    @meta_description=""

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @announcementcategory }
    end
  end

  # GET /announcementcategories/new
  # GET /announcementcategories/new.xml
  def new
    @announcementcategory = Announcementcategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @announcementcategory }
    end
  end

  # GET /announcementcategories/1/edit
  def edit
    @announcementcategory = Announcementcategory.find_by_permalink(params[:id])
  end

  # POST /announcementcategories
  # POST /announcementcategories.xml
  def create
    @announcementcategory = Announcementcategory.new(params[:announcementcategory])

    respond_to do |format|
      if @announcementcategory.save
        format.html { redirect_to(@announcementcategory, :notice => 'Announcementcategory was successfully created.') }
        format.xml  { render :xml => @announcementcategory, :status => :created, :location => @announcementcategory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @announcementcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /announcementcategories/1
  # PUT /announcementcategories/1.xml
  def update
    @announcementcategory = Announcementcategory.find_by_permalink(params[:id])

    respond_to do |format|
      if @announcementcategory.update_attributes(params[:announcementcategory])
        format.html { redirect_to(@announcementcategory, :notice => 'Announcementcategory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @announcementcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /announcementcategories/1
  # DELETE /announcementcategories/1.xml
  def destroy
    @announcementcategory = Announcementcategory.find_by_permalink(params[:id])
    @announcementcategory.destroy

    respond_to do |format|
      format.html { redirect_to(announcementcategories_url) }
      format.xml  { head :ok }
    end
  end
end
