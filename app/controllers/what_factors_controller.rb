class WhatFactorsController < ApplicationController
  include JsonMapper
  # GET /what_factors
  # GET /what_factors.xml
  def index
    @what_factors = WhatFactor.all(:include => [:what_urlgroup, :what_custom, :what_qo, :code_factor], :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @what_factors }
	  format.rule {

	  	temp_array = []
		what_qos = WhatQo.all
		what_qos.each do |factor|
			temp_array << factor.data_to_ruleset
		end
		@what_qos_output = temp_array.join("\n")

		temp_array = []
		what_urlgroups = WhatUrlgroup.all
		what_urlgroups.each do |factor|
			temp_array << factor.data_to_ruleset
		end 
		@what_urlgroups_output = temp_array.join("\n")

		temp_array = []
		what_custom_factors = WhatCustomFactor.all
		what_custom_factors.each do |factor|
			temp_array << (factor.name + ", string(20)")
			temp_array.uniq!
		end
		@what_custom_factors_output = temp_array.join("\n")

		temp_array = []
		what_customs = WhatCustom.all
		what_customs.each do |factor|

            debugger

			temp_array << factor.data_to_ruleset
		end
		@what_customs_output = temp_array.join("\n")

		temp_array = []
	  	@what_factors.each do |factor|
			temp_array << factor.data_to_ruleset
		end
		@what_factors_output = temp_array.join("\n")

		output = render_to_string(:file => TMPL_PATH + RULE['WhatFactor']['tmpl'])
		save_to_ruleset(output)

	  	render :rule => output
	  }
      format.json  { 

		@returns = Hash.new
	  	temp_array = []
		@what_factors.each do |factor|
			temp_array << mapping_to_hash(factor, WhatFactor.json_mapping_table)
		end 

	  	render :json => temp_array
	  }
    end
  end

  def save_to_ruleset(output)
  	file_name = RULE_PATH + RULE['WhatFactor']['rule']
	File.delete(file_name) if File.exist?(file_name)

  	file = File.new(file_name, "w")
	file << output
	file.close
  end 

  # GET /what_factors/1
  # GET /what_factors/1.xml
  def show
    @what_factor = WhatFactor.find(params[:id], :include => [:what_urlgroup, :what_qo, :what_custom, :code_factor])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @what_factor }
      format.json  {
	  	render :json => mapping_to_hash(@what_factor, WhatFactor.json_mapping_table)
	  }	
    end
  end

  # GET /what_factors/new
  # GET /what_factors/new.xml
  def new
    @what_factor = WhatFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @what_factor }
    end
  end

  # GET /what_factors/1/edit
  def edit
    @what_factor = WhatFactor.find(params[:id])
  end

  # POST /what_factors
  # POST /what_factors.xml
  def create
    @what_factor = WhatFactor.new(params[:what_factor])

    respond_to do |format|
      if @what_factor.save
        format.html { redirect_to(@what_factor, :notice => 'WhatFactor was successfully created.') }
        format.xml  { render :xml => @what_factor, :status => :created, :location => @what_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @what_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /what_factors/1
  # PUT /what_factors/1.xml
  def update
    @what_factor = WhatFactor.find(params[:id])

    respond_to do |format|
      if @what_factor.update_attributes(params[:what_factor])
        format.html { redirect_to(@what_factor, :notice => 'WhatFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @what_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /what_factors/1
  # DELETE /what_factors/1.xml
  def destroy
    @what_factor = WhatFactor.find(params[:id])
    @what_factor.destroy

    respond_to do |format|
      format.html { redirect_to(what_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end

