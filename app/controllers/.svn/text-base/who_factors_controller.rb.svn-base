class WhoFactorsController < ApplicationController
  include JsonMapper
  # GET /who_factors
  # GET /who_factors.xml
  def index
    @who_factors = WhoFactor.all(:include => [:who_member, :who_number, :who_prefix, :who_country, :who_custom])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_factors }
      format.json  { 

		temp_array = []
	  	@who_factors.each do |factor| 
			temp_array << mapping_to_hash(factor, WhoFactor.json_mapping_table)
		end 
	  	render :json => temp_array
	  }
	  format.rule {

	  	temp_array = []
		who_members = WhoMember.all
		who_members.each do |factor|
			temp_array << factor.data_to_ruleset
		end 
		@who_members_output = temp_array.join("\n")

		temp_array = []
		who_numbers = WhoNumber.all
		who_numbers.each do |factor|
			temp_array << factor.data_to_ruleset
		end
		@who_numbers_output = temp_array.join("\n")

		temp_array = []
		who_prefixes = WhoPrefix.all
		who_prefixes.each do |factor|
			temp_array << factor.data_to_ruleset
		end
		@who_prefixes_output = temp_array.join("\n")

		temp_array = []
		who_countries = WhoCountry.all
		who_countries.each do |factor|
			temp_array << factor.data_to_ruleset
		end
		@who_countries_output = temp_array.join("\n")

		temp_array = []
		who_custom_factors = WhoCustomFactor.all
		who_custom_factors.each do |factor|
			temp_array << (factor.name + ", string(20)")
		end
		@who_custom_factors_output = temp_array.join("\n")

		temp_array = []
		who_customs = WhoCustom.all
		who_customs.each do |factor|
			temp_array << factor.data_to_ruleset
		end
		@who_customs_output = temp_array.join("\n")

		temp_array = []
		@who_factors.each do |factor|
			temp_array << factor.data_to_ruleset
		end
		@who_factors_output = temp_array.join("\n")

		output = render_to_string(:file => TMPL_PATH + RULE['WhoFactor']['tmpl'])
		save_to_ruleset(output)

		render :rule => output
	  }
    end
  end

  def save_to_ruleset(output)
  	file_name = RULE_PATH + RULE['WhoFactor']['rule']
	File.delete(file_name) if File.exist?(file_name)

	file = File.new(file_name, "w")
	file << output
	file.close
  end 

  # GET /who_factors/1
  # GET /who_factors/1.xml
  def show
    @who_factor = WhoFactor.find(params[:id], :include => [:who_member, :who_number, :who_prefix, :who_country, :who_custom])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_factor }
      format.json  { 
	  	render :json => mapping_to_hash(@who_factor, WhoFactor.json_mapping_table)
	  }
    end
  end

  # GET /who_factors/new
  # GET /who_factors/new.xml
  def new
    @who_factor = WhoFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_factor }
    end
  end

  # GET /who_factors/1/edit
  def edit
    @who_factor = WhoFactor.find(params[:id])
  end

  # POST /who_factors
  # POST /who_factors.xml
  def create
    @who_factor = WhoFactor.new(params[:who_factor])

    respond_to do |format|
      if @who_factor.save
        format.html { redirect_to(@who_factor, :notice => 'WhoFactor was successfully created.') }
        format.xml  { render :xml => @who_factor, :status => :created, :location => @who_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_factors/1
  # PUT /who_factors/1.xml
  def update
    @who_factor = WhoFactor.find(params[:id])

    respond_to do |format|
      if @who_factor.update_attributes(params[:who_factor])
        format.html { redirect_to(@who_factor, :notice => 'WhoFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_factors/1
  # DELETE /who_factors/1.xml
  def destroy
    @who_factor = WhoFactor.find(params[:id])
    @who_factor.destroy

    respond_to do |format|
      format.html { redirect_to(who_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
