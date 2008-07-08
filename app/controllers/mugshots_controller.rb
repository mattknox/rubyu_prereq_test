class MugshotsController < ApplicationController
  # GET /mugshots
  # GET /mugshots.xml
  def index
    @mugshots = Mugshot.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mugshots }
    end
  end

  # GET /mugshots/1
  # GET /mugshots/1.xml
  def show
    @mugshot = Mugshot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mugshot }
    end
  end

  # GET /mugshots/new
  # GET /mugshots/new.xml
  def new
    @mugshot = Mugshot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mugshot }
    end
  end

  # GET /mugshots/1/edit
  def edit
    @mugshot = Mugshot.find(params[:id])
  end

  # POST /mugshots
  # POST /mugshots.xml
  def create
    @mugshot = Mugshot.new(params[:mugshot])

    respond_to do |format|
      if @mugshot.save
        flash[:notice] = 'Mugshot was successfully created.'
        format.html { redirect_to(@mugshot) }
        format.xml  { render :xml => @mugshot, :status => :created, :location => @mugshot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mugshot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mugshots/1
  # PUT /mugshots/1.xml
  def update
    @mugshot = Mugshot.find(params[:id])

    respond_to do |format|
      if @mugshot.update_attributes(params[:mugshot])
        flash[:notice] = 'Mugshot was successfully updated.'
        format.html { redirect_to(@mugshot) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mugshot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mugshots/1
  # DELETE /mugshots/1.xml
  def destroy
    @mugshot = Mugshot.find(params[:id])
    @mugshot.destroy

    respond_to do |format|
      format.html { redirect_to(mugshots_url) }
      format.xml  { head :ok }
    end
  end
end
