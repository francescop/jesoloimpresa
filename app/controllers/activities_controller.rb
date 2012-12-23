class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.xml
  
  before_filter :authorize, :except => [:index, :show]
  
  def index
    #@activities = Activity.all

    @search = Activity.search(params[:search])
    @activities = @search.all(:order=> "peso")
    #@activities = Activity.find(:all,:order=> "peso")

    respond_to do |format|
      format.html # index.html.erb
      format.iphone {render :layout => false}
      format.xml  { render :xml => @activities }
    end
  end
  
  def list
    @activities = Activity.all(:order=> "expiredate")
  end
  
  # GET /activities/1
  # GET /activities/1.xml
  def show
    #@activity = Activity.find(params[:id])
    @activity = Activity.find_by_permalink(params[:id])
    
    @meta_title=@activity.name + " a Jesolo"
    @meta_keywords=@activity.metatag
    @meta_description=@activity.description

    respond_to do |format|
      format.html # show.html.erb
      format.iphone {render :layout => false}
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = Activity.new
    @categories = Category.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    #@activity = Activity.find(params[:id])
    @activity = Activity.find_by_permalink(params[:id])
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to(@activity, :notice => 'Activity was successfully created.') }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    #@activity = Activity.find(params[:id])
    @activity = Activity.find_by_permalink(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to(@activity, :notice => 'Activity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    #@activity = Activity.find(params[:id])
    @activity = Activity.find_by_permalink(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(activities_url) }
      format.xml  { head :ok }
    end
  end
end
