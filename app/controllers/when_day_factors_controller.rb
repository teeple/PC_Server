class WhenDayFactorsController < ApplicationController
  # GET /when_day_factors
  # GET /when_day_factors.xml
  def index
    @when_day_factors = WhenDayFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_day_factors }
      format.json  { render :json => @when_day_factors }
    end
  end

  # GET /when_day_factors/1
  # GET /when_day_factors/1.xml
  def show
    @when_day_factor = WhenDayFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_day_factor }
    end
  end

  # GET /when_day_factors/new
  # GET /when_day_factors/new.xml
  def new
    @when_day_factor = WhenDayFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_day_factor }
    end
  end

  # GET /when_day_factors/1/edit
  def edit
    @when_day_factor = WhenDayFactor.find(params[:id])
  end

  # POST /when_day_factors
  # POST /when_day_factors.xml
  def create
    @when_day_factor = WhenDayFactor.new(params[:when_day_factor])

    respond_to do |format|
      if @when_day_factor.save
        format.html { redirect_to(@when_day_factor, :notice => 'WhenDayFactor was successfully created.') }
        format.xml  { render :xml => @when_day_factor, :status => :created, :location => @when_day_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_day_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_day_factors/1
  # PUT /when_day_factors/1.xml
  def update
    @when_day_factor = WhenDayFactor.find(params[:id])

    respond_to do |format|
      if @when_day_factor.update_attributes(params[:when_day_factor])
        format.html { redirect_to(@when_day_factor, :notice => 'WhenDayFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_day_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_day_factors/1
  # DELETE /when_day_factors/1.xml
  def destroy
    @when_day_factor = WhenDayFactor.find(params[:id])
    @when_day_factor.destroy

    respond_to do |format|
      format.html { redirect_to(when_day_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
