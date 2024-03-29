class NewsController < ApplicationController
  # GET /news
  # GET /news.xml
  
  before_filter :authorize, :except => [:index, :show]
  
  
  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
      format.iphone {render :layout => false}
    end
  end

  # GET /news/1
  # GET /news/1.xml
  def show
    #@news = News.find(params[:id])
    @all_news = News.all
    @news = News.find_by_permalink(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news }
      format.iphone {render :layout => false}
    end
  end

  # GET /news/new
  # GET /news/new.xml
  def new
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/1/edit
  def edit
    #@news = News.find(params[:id])
    @news = News.find_by_permalink(params[:id])
  end

  # POST /news
  # POST /news.xml
  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to(@news, :notice => 'News was successfully created.') }
        format.xml  { render :xml => @news, :status => :created, :location => @news }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.xml
  def update
    #@news = News.find(params[:id])
    @news = News.find_by_permalink(params[:id])
    
    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to(@news, :notice => 'News was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.xml
  def destroy
    #@news = News.find(params[:id])
    @news = News.find_by_permalink(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to(news_index_url) }
      format.xml  { head :ok }
    end
  end
end
