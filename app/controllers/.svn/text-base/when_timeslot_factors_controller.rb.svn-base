class WhenTimeslotFactorsController < ApplicationController
  # GET /when_timeslot_factors
  # GET /when_timeslot_factors.xml
  def index
    @when_timeslot_factors = WhenTimeslotFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_timeslot_factors }
    end
  end

  # GET /when_timeslot_factors/1
  # GET /when_timeslot_factors/1.xml
  def show
    @when_timeslot_factor = WhenTimeslotFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_timeslot_factor }
    end
  end

  # GET /when_timeslot_factors/new
  # GET /when_timeslot_factors/new.xml
  def new
    @when_timeslot_factor = WhenTimeslotFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_timeslot_factor }
    end
  end

  # GET /when_timeslot_factors/1/edit
  def edit
    @when_timeslot_factor = WhenTimeslotFactor.find(params[:id])
  end

  # POST /when_timeslot_factors
  # POST /when_timeslot_factors.xml
  def create
    @when_timeslot_factor = WhenTimeslotFactor.new(params[:when_timeslot_factor])

    respond_to do |format|
      if @when_timeslot_factor.save
        format.html { redirect_to(@when_timeslot_factor, :notice => 'WhenTimeslotFactor was successfully created.') }
        format.xml  { render :xml => @when_timeslot_factor, :status => :created, :location => @when_timeslot_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_timeslot_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_timeslot_factors/1
  # PUT /when_timeslot_factors/1.xml
  def update
    @when_timeslot_factor = WhenTimeslotFactor.find(params[:id])

    respond_to do |format|
      if @when_timeslot_factor.update_attributes(params[:when_timeslot_factor])
        format.html { redirect_to(@when_timeslot_factor, :notice => 'WhenTimeslotFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_timeslot_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_timeslot_factors/1
  # DELETE /when_timeslot_factors/1.xml
  def destroy
    @when_timeslot_factor = WhenTimeslotFactor.find(params[:id])
    @when_timeslot_factor.destroy

    respond_to do |format|
      format.html { redirect_to(when_timeslot_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
