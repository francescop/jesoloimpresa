class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  
  before_filter :authorize, :except => [:index, :show]
  
  def index
    
    @meta_title="Aziende a Jesolo"
    @meta_keywords="aziende a jesolo"
    @meta_description="aziende a jesolo description"

    #@categories = Category.all(:order => 'name ASC')
    
    if params[:search]
    @search = Category.search(params[:search])
    #if @search
      if (@search.count > 1)
        @categories = @search.all(:order => 'name ASC')
      else
        @category = @search.first
        redirect_to(@category)
      end
    else
      @categories = Category.all(:order => 'name ASC')
    end
    
#    respond_to do |format|
#      format.html # index.html.erb
#      format.iphone {render :layout => false}
#      format.xml  { render :xml => @categories }
#    end
  end

  
  def list
    @categories = Category.all
  end

  
  # GET /categories/1
  # GET /categories/1.xml
  def show
    #@category = Category.find(params[:id])
    @category = Category.find_by_permalink(params[:id])
    
    @meta_title=@category.name + " a Jesolo"
    @meta_keywords=@category.metatag
    @meta_description=@category.description

    respond_to do |format|
      format.html # show.html.erb
      format.iphone {render :layout => false}
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    #@category = Category.find(params[:id])
    @category = Category.find_by_permalink(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    #@category = Category.find(params[:id])
    @category = Category.find_by_permalink(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    #@category = Category.find(params[:id])
    @category = Category.find_by_permalink(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end
end
