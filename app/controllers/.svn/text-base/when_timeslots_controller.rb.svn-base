class WhenTimeslotsController < ApplicationController
  # GET /when_timeslots
  # GET /when_timeslots.xml
  def index
    @when_timeslots = WhenTimeslot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_timeslots }
      format.json  { render :json => @when_timeslots }
      format.rule  { render :rule => @when_timeslots }
    end
  end

  # GET /when_timeslots/1
  # GET /when_timeslots/1.xml
  def show
    @when_timeslot = WhenTimeslot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_timeslot }
      format.json  { render :json => @when_timeslot }
    end
  end

  # GET /when_timeslots/new
  # GET /when_timeslots/new.xml
  def new
    @when_timeslot = WhenTimeslot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_timeslot }
    end
  end

  # GET /when_timeslots/1/edit
  def edit
    @when_timeslot = WhenTimeslot.find(params[:id])
  end

  # POST /when_timeslots
  # POST /when_timeslots.xml
  def create
    @when_timeslot = WhenTimeslot.new(params[:when_timeslot])

    respond_to do |format|
      if @when_timeslot.save
        format.html { redirect_to(@when_timeslot, :notice => 'WhenTimeslot was successfully created.') }
        format.xml  { render :xml => @when_timeslot, :status => :created, :location => @when_timeslot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_timeslot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_timeslots/1
  # PUT /when_timeslots/1.xml
  def update
    @when_timeslot = WhenTimeslot.find(params[:id])

    respond_to do |format|
      if @when_timeslot.update_attributes(params[:when_timeslot])
        format.html { redirect_to(@when_timeslot, :notice => 'WhenTimeslot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_timeslot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_timeslots/1
  # DELETE /when_timeslots/1.xml
  def destroy
    @when_timeslot = WhenTimeslot.find(params[:id])
    @when_timeslot.destroy

    respond_to do |format|
      format.html { redirect_to(when_timeslots_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
