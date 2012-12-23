class MapsController < ApplicationController
  
  def index
    #@activities=Activity.all(:order => 'name')
    #@activity = nil
    @searched_activities = Activity.search(params[:search])
    if @searched_activities.count == Activity.all.count
      @activities == nil
    else
      @activities = @searched_activities.all(:order=> "peso")
    end
        
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end
  
  def search
    @activities=Activity.all(:order => 'name')
    @activity = @activities.first
  end
  
  def percorso
    
  end
  

end