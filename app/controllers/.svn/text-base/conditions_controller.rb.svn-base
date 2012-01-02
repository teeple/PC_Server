class ConditionsController < ApplicationController
  include JsonMapper
  # GET /conditions
  # GET /conditions.xml
  def index
    @conditions = Condition.all(:order => "id DESC")

	@who_factors =  WhoFactor.all(:order => "id DESC")
	@what_factors =  WhatFactor.all(:order => "id DESC")
	@where_factors =  WhereFactor.all(:order => "id DESC")
	@when_factors = WhenFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @conditions }
      format.json  { 

		@results = Hash.new

		items = []
	  	@who_factors.each do |c|
			items << mapping_to_hash(c, WhoFactor.json_mapping_table_summary)
		end 
		@results['Who_factors'] = items

		items = []
	  	@what_factors.each do |c|
			items << mapping_to_hash(c, WhatFactor.json_mapping_table_summary)
		end 
		@results['What_factors'] = items

		items = []
	  	@where_factors.each do |c|
			items << mapping_to_hash(c, WhereFactor.json_mapping_table_summary)
		end 
		@results['Where_factors'] = items

		items = []
	  	@when_factors.each do |c|
			items << mapping_to_hash(c, WhenFactor.json_mapping_table_summary)
		end 
		@results['When_factors'] = items 

	  	render :json => @results 
	  }
	  format.rule {

		@who_factors_output = Hash.new
	  	@who_factors.each do |c|
			@who_factors_output[c.fctr_code] = c.data_to_ruleset
		end 
		output_who_factor = render_to_string(:file => TMPL_PATH + RULE['WhoFactor']['tmpl'])
		save_to_ruleset(:CONDITION_WHO, output_who_factor)

		@what_factors_output = Hash.new
	  	@what_factors.each do |c|
			@what_factors_output[c.fctr_code] =  c.data_to_ruleset
		end 
		output_what_factor = render_to_string(:file => TMPL_PATH + RULE['WhatFactor']['tmpl'])
		save_to_ruleset(:CONDITION_WHAT, output_who_factor)

		@where_factors_output = Hash.new
	  	@where_factors.each do |c|
			@where_factors_output[c.fctr_code] = c.data_to_ruleset
		end 
		output_where_factor = render_to_string(:file => TMPL_PATH + RULE['WhereFactor']['tmpl'])
		save_to_ruleset(:CONDITION_WHERE, output_who_factor)

		@when_factors_output = Hash.new
	  	@when_factors.each do |c|
			@when_factors_output[c.fctr_code] = c.data_to_ruleset
		end 
		output_when_factor = render_to_string(:file => TMPL_PATH + RULE['WhenFactor']['tmpl'])
		save_to_ruleset(:CONDITION_WHEN, output_who_factor)

		@conditions_output = []

		@conditions_output << output_who_factor
		@conditions_output << output_what_factor
		@conditions_output << output_where_factor
		@conditions_output << output_when_factor

		render :rule => @conditions_output 
	  }
    end
  end

  def save_to_ruleset(condition_name, output)
  	case condition_name
		when :CONDITION_WHO:
  			file_name = RULE_PATH + RULE['WhoFactor']['rule']
		when :CONDITION_WHAT:
  			file_name = RULE_PATH + RULE['WhatFactor']['rule']
		when :CONDITION_WHERE:
  			file_name = RULE_PATH + RULE['WhereFactor']['rule']
		when :CONDITION_WHEN:
  			file_name = RULE_PATH + RULE['WhenFactor']['rule']
	end 

	File.delete(file_name) if File.exist?(file_name)

	file = File.new(file_name, "w")
	file << output
	file.close

  end 

  # GET /conditions/1
  # GET /conditions/1.xml
  def show
    @condition = Condition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @condition }
    end
  end

  # GET /conditions/new
  # GET /conditions/new.xml
  def new
    @condition = Condition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @condition }
    end
  end

  # GET /conditions/1/edit
  def edit
    @condition = Condition.find(params[:id])
  end

  # POST /conditions
  # POST /conditions.xml
  def create
    @condition = Condition.new(params[:condition])

    respond_to do |format|
      if @condition.save
        format.html { redirect_to(@condition, :notice => 'Condition was successfully created.') }
        format.xml  { render :xml => @condition, :status => :created, :location => @condition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /conditions/1
  # PUT /conditions/1.xml
  def update
    @condition = Condition.find(params[:id])

    respond_to do |format|
      if @condition.update_attributes(params[:condition])
        format.html { redirect_to(@condition, :notice => 'Condition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /conditions/1
  # DELETE /conditions/1.xml
  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy

    respond_to do |format|
      format.html { redirect_to(conditions_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
