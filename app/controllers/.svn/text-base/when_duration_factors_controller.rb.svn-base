class WhenDurationFactorsController < ApplicationController
  # GET /when_duration_factors
  # GET /when_duration_factors.xml
  def index
    @when_duration_factors = WhenDurationFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_duration_factors }
    end
  end

  # GET /when_duration_factors/1
  # GET /when_duration_factors/1.xml
  def show
    @when_duration_factor = WhenDurationFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_duration_factor }
    end
  end

  # GET /when_duration_factors/new
  # GET /when_duration_factors/new.xml
  def new
    @when_duration_factor = WhenDurationFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_duration_factor }
    end
  end

  # GET /when_duration_factors/1/edit
  def edit
    @when_duration_factor = WhenDurationFactor.find(params[:id])
  end

  # POST /when_duration_factors
  # POST /when_duration_factors.xml
  def create
    @when_duration_factor = WhenDurationFactor.new(params[:when_duration_factor])

    respond_to do |format|
      if @when_duration_factor.save
        format.html { redirect_to(@when_duration_factor, :notice => 'WhenDurationFactor was successfully created.') }
        format.xml  { render :xml => @when_duration_factor, :status => :created, :location => @when_duration_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_duration_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_duration_factors/1
  # PUT /when_duration_factors/1.xml
  def update
    @when_duration_factor = WhenDurationFactor.find(params[:id])

    respond_to do |format|
      if @when_duration_factor.update_attributes(params[:when_duration_factor])
        format.html { redirect_to(@when_duration_factor, :notice => 'WhenDurationFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_duration_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_duration_factors/1
  # DELETE /when_duration_factors/1.xml
  def destroy
    @when_duration_factor = WhenDurationFactor.find(params[:id])
    @when_duration_factor.destroy

    respond_to do |format|
      format.html { redirect_to(when_duration_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
