class WhenFactorsController < ApplicationController
  include JsonMapper
  # GET /when_factors
  # GET /when_factors.xml
  def index
    @when_factors = WhenFactor.all(:include => [:when_duration, :when_week, :when_timeslot, :when_day, :when_custom], :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_factors }
      format.json  { 

		temp_array = []

		@when_factors.each do |when_factor|
			temp_array << mapping_to_hash(when_factor, WhenFactor.json_mapping_table)
		end 
	  	render :json => temp_array
      }
      format.rule {

		temp_array = []
		when_durations = WhenDuration.all
		when_durations.each do |factor|
			temp_array << factor.data_to_ruleset
		end 
		@when_durations_output = temp_array.join("\n")

		temp_array = []
		when_weeks = WhenWeek.all
		when_weeks.each do |factor|
			temp_array << factor.data_to_ruleset
		end 
		@when_weeks_output = temp_array.join("\n")

		temp_array = []
		when_timeslots = WhenTimeslot.all
		when_timeslots.each do |factor|
			temp_array << factor.data_to_ruleset
		end 
		@when_timeslots_output = temp_array.join("\n")

		temp_array = []
		when_days = WhenDay.all
		when_days.each do |factor|
			temp_array << factor.data_to_ruleset
		end 
		@when_days_output = temp_array.join("\n")

		temp_array = []
		when_custom_factors = WhenCustomFactor.all
		when_custom_factors.each do |factor|
			temp_array << (factor.name + ", string(20)")
			temp_array.uniq!
		end 
		@when_custom_factors_output = temp_array.join("\n")

		temp_array = []
		when_customs = WhenCustom.all
		when_customs.each do |factor|
			temp_str = factor.data_to_ruleset
			temp_array << temp_str if temp_str.size > 0
		end 
		@when_customs_output = temp_array.join("\n")

		temp_array = []
	  	@when_factors.each do |factor|
			temp_array << factor.data_to_ruleset
		end
		@when_factors_output = temp_array.join("\n")

		output = render_to_string(:file => TMPL_PATH + RULE['WhenFactor']['tmpl'])
		save_to_ruleset(output)

	  	render :rule => output
	  }
    end
  end

  def save_to_ruleset(output)
  	file_name = RULE_PATH + RULE['WhenFactor']['rule']
	File.delete(file_name) if File.exist?(file_name)

	file = File.new(file_name, "w")
	file << output
	file.close
  end 

  # GET /when_factors/1
  # GET /when_factors/1.xml
  def show
    @when_factor = WhenFactor.find(params[:id],:include => [:when_duration, :when_week, :when_timeslot, :when_day, :when_custom])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_factor }
      format.json  { 
	  	render :json => mapping_to_hash(@when_factor, WhenFactor.json_mapping_table)
	  }
    end
  end

  # GET /when_factors/new
  # GET /when_factors/new.xml
  def new
    @when_factor = WhenFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_factor }
    end
  end

  # GET /when_factors/1/edit
  def edit
    @when_factor = WhenFactor.find(params[:id])
  end

  # POST /when_factors
  # POST /when_factors.xml
  def create
    @when_factor = WhenFactor.new(params[:when_factor])

    respond_to do |format|
      if @when_factor.save
        format.html { redirect_to(@when_factor, :notice => 'WhenFactor was successfully created.') }
        format.xml  { render :xml => @when_factor, :status => :created, :location => @when_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_factors/1
  # PUT /when_factors/1.xml
  def update
    @when_factor = WhenFactor.find(params[:id])

    respond_to do |format|
      if @when_factor.update_attributes(params[:when_factor])
        format.html { redirect_to(@when_factor, :notice => 'WhenFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_factors/1
  # DELETE /when_factors/1.xml
  def destroy
    @when_factor = WhenFactor.find(params[:id])
    @when_factor.destroy

    respond_to do |format|
      format.html { redirect_to(when_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
