class AnnouncementsController < ApplicationController
  # GET /announcements
  # GET /announcements.xml
    
  layout 'annunci'
  before_filter :authorize, :except => [:show, :new, :create]
  
  def index
    @announcements = Announcement.all
    
    @banner = Banner.find(:all, :order => 'random()', :limit => 1)
   
    @meta_title="Jesolo Annunci"
    @meta_keywords=""
    @meta_description=""

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @announcements }
    end
  end

  # GET /announcements/1
  # GET /announcements/1.xml
  def show
    @announcement = Announcement.find_by_permalink(params[:id])
    
    @banner = Banner.find(:all, :order => 'random()', :limit => 1)

    
    @meta_title=@announcement.titolo
    @meta_keywords=""
    @meta_description=""

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @announcement }
    end
  end

  # GET /announcements/new
  # GET /announcements/new.xml
  def new
    @announcement = Announcement.new
    
    @banner = Banner.find(:all, :order => 'random()', :limit => 1)

    
    @meta_title="Nuovo Annuncio"
    @meta_keywords=""
    @meta_description=""

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @announcement }
    end
  end

  # GET /announcements/1/edit
  def edit
    @announcement = Announcement.find_by_permalink(params[:id])
  end

  # POST /announcements
  # POST /announcements.xml
  def create
    @announcement = Announcement.new(params[:announcement])
    @banner = Banner.find(:all, :order => 'random()', :limit => 1)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to(@announcement, :notice => 'Annuncio correttamente creato. Sarà controllato e successivamente pubblicato.') }
        format.xml  { render :xml => @announcement, :status => :created, :location => @announcement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @announcement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.xml
  def update
    @announcement = Announcement.find_by_permalink(params[:id])
    @banner = Banner.find(:all, :order => 'random()', :limit => 1)

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        format.html { redirect_to(@announcement, :notice => 'Announcement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @announcement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.xml
  def destroy
    @announcement = Announcement.find_by_permalink(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to(announcements_url) }
      format.xml  { head :ok }
    end
  end
end
