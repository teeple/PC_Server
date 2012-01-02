class WhenWeeksController < ApplicationController
  # GET /when_weeks
  # GET /when_weeks.xml
  def index
    @when_weeks = WhenWeek.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_weeks }
      format.json  { render :json => @when_weeks }
    end
  end

  # GET /when_weeks/1
  # GET /when_weeks/1.xml
  def show
    @when_week = WhenWeek.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_week }
      format.json  { render :json => @when_week }
    end
  end

  # GET /when_weeks/new
  # GET /when_weeks/new.xml
  def new
    @when_week = WhenWeek.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_week }
    end
  end

  # GET /when_weeks/1/edit
  def edit
    @when_week = WhenWeek.find(params[:id])
  end

  # POST /when_weeks
  # POST /when_weeks.xml
  def create
    @when_week = WhenWeek.new(params[:when_week])

    respond_to do |format|
      if @when_week.save
        format.html { redirect_to(@when_week, :notice => 'WhenWeek was successfully created.') }
        format.xml  { render :xml => @when_week, :status => :created, :location => @when_week }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_week.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_weeks/1
  # PUT /when_weeks/1.xml
  def update
    @when_week = WhenWeek.find(params[:id])

    respond_to do |format|
      if @when_week.update_attributes(params[:when_week])
        format.html { redirect_to(@when_week, :notice => 'WhenWeek was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_week.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_weeks/1
  # DELETE /when_weeks/1.xml
  def destroy
    @when_week = WhenWeek.find(params[:id])
    @when_week.destroy

    respond_to do |format|
      format.html { redirect_to(when_weeks_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
