class WhenDaysController < ApplicationController
  # GET /when_days
  # GET /when_days.xml
  def index
    @when_days = WhenDay.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_days }
      format.json  { render :json => @when_days }
      format.rule  { render :rule => @when_days }
    end
  end

  # GET /when_days/1
  # GET /when_days/1.xml
  def show
    @when_day = WhenDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_day }
      format.json  { render :json => @when_days }
      format.rule  { render :rule => @when_days }
    end
  end

  # GET /when_days/new
  # GET /when_days/new.xml
  def new
    @when_day = WhenDay.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_day }
    end
  end

  # GET /when_days/1/edit
  def edit
    @when_day = WhenDay.find(params[:id])
  end

  # POST /when_days
  # POST /when_days.xml
  def create
    @when_day = WhenDay.new(params[:when_day])

    respond_to do |format|
      if @when_day.save
        format.html { redirect_to(@when_day, :notice => 'WhenDay was successfully created.') }
        format.xml  { render :xml => @when_day, :status => :created, :location => @when_day }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_days/1
  # PUT /when_days/1.xml
  def update
    @when_day = WhenDay.find(params[:id])

    respond_to do |format|
      if @when_day.update_attributes(params[:when_day])
        format.html { redirect_to(@when_day, :notice => 'WhenDay was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_days/1
  # DELETE /when_days/1.xml
  def destroy
    @when_day = WhenDay.find(params[:id])
    @when_day.destroy

    respond_to do |format|
      format.html { redirect_to(when_days_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
