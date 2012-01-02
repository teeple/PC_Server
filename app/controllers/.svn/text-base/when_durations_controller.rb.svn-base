class WhenDurationsController < ApplicationController
  # GET /when_durations
  # GET /when_durations.xml
  def index
    @when_durations = WhenDuration.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_durations }
      format.json  {

		@returns = Hash.new
		temp_array = []
	  	@when_durations.each do |when_duration|
			temp_array << when_duration.to_json_frontend
		end 

		@returns['when_durations'] = temp_array 

	  	render :json => @returns 
	  }
	  format.rule { render :rule =>  @when_durations }
    end
  end

  # GET /when_durations/1
  # GET /when_durations/1.xml
  def show
    @when_duration = WhenDuration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_duration }
      format.json  { render :json => @when_duration }
	  format.rule { render :rule =>  @when_duration }
    end
  end

  # GET /when_durations/new
  # GET /when_durations/new.xml
  def new
    @when_duration = WhenDuration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_duration }
    end
  end

  # GET /when_durations/1/edit
  def edit
    @when_duration = WhenDuration.find(params[:id])
  end

  # POST /when_durations
  # POST /when_durations.xml
  def create
    @when_duration = WhenDuration.new(params[:when_duration])

    respond_to do |format|
      if @when_duration.save
        format.html { redirect_to(@when_duration, :notice => 'WhenDuration was successfully created.') }
        format.xml  { render :xml => @when_duration, :status => :created, :location => @when_duration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_duration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_durations/1
  # PUT /when_durations/1.xml
  def update
    @when_duration = WhenDuration.find(params[:id])

    respond_to do |format|
      if @when_duration.update_attributes(params[:when_duration])
        format.html { redirect_to(@when_duration, :notice => 'WhenDuration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_duration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_durations/1
  # DELETE /when_durations/1.xml
  def destroy
    @when_duration = WhenDuration.find(params[:id])
    @when_duration.destroy

    respond_to do |format|
      format.html { redirect_to(when_durations_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
