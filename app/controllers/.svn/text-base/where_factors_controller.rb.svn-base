class WhereFactorsController < ApplicationController
  include JsonMapper
  # GET /where_factors
  # GET /where_factors.xml
  def index
    @where_factors = WhereFactor.all(:include => [:where_country, :where_zone, :where_network, :where_custom])

    respond_to do |format|
      format.html # index.html.erb
	  format.xml  { render :xml => @where_factors }
	  format.json  {
		temp_array = []
		@where_factors.each do |factor|
			temp_array << mapping_to_hash(factor, WhereFactor.json_mapping_table)
		end

		render :json => temp_array
	  }
	  format.rule {

		  temp_array = []
		  where_countries  = WhereCountry.all
		  where_countries.each do |factor|
		  	temp_array << factor.data_to_ruleset
		  end
		  @where_countries_output = temp_array.join("\n")

		  temp_array = []
		  where_zones = WhereZone.all
		  where_zones.each do |factor|
		  	temp_array << factor.data_to_ruleset
		  end
		  @where_zones_output = temp_array.join("\n")

		  temp_array = []
		  where_networks  = WhereNetwork.all
		  where_networks.each do |factor|
		  	temp_array << factor.data_to_ruleset
		  end
		  @where_networks_output = temp_array.join("\n")

		  temp_array = []
		  where_custom_factors = WhereCustomFactor.all
		  where_custom_factors.each do |factor|
		  	temp_array << (factor.name + ", string(20)")
			temp_array.uniq!
		  end
		  @where_custom_factors_output = temp_array.join("\n")

		  temp_array = []
		  where_customs  = WhereCustom.all
		  where_customs.each do |factor|
		  	temp_array << factor.data_to_ruleset
		  end
		  @where_customs_output = temp_array.join("\n")

		  temp_array = []
		  @where_factors.each do |factor|
		  	temp_str = factor.data_to_ruleset
		  	temp_array << temp_str if temp_str.size > 0
		  end
		  @where_factors_output = temp_array.join("\n")

		  output = render_to_string(:file => TMPL_PATH + RULE['WhereFactor']['tmpl'])
		  save_to_ruleset(output)

		  render :rule => output
	  }
    end
  end

  def save_to_ruleset(output)
	file_name = RULE_PATH + RULE['WhereFactor']['rule']
	File.delete(file_name) if File.exist?(file_name)

	file = File.new(file_name, "w")
	file << output
	file.close
  end

  # GET /where_factors/1
  # GET /where_factors/1.xml
  def show
    @where_factor = WhereFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_factor }
      format.json  { 
	  	render :json => mapping_to_hash(@where_factor, WhereFactor.json_mapping_table)
	  }
    end
  end

  # GET /where_factors/new
  # GET /where_factors/new.xml
  def new
    @where_factor = WhereFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_factor }
    end
  end

  # GET /where_factors/1/edit
  def edit
    @where_factor = WhereFactor.find(params[:id])
  end

  # POST /where_factors
  # POST /where_factors.xml
  def create
    @where_factor = WhereFactor.new(params[:where_factor])

    respond_to do |format|
      if @where_factor.save
        format.html { redirect_to(@where_factor, :notice => 'WhereFactor was successfully created.') }
        format.xml  { render :xml => @where_factor, :status => :created, :location => @where_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_factors/1
  # PUT /where_factors/1.xml
  def update
    @where_factor = WhereFactor.find(params[:id])

    respond_to do |format|
      if @where_factor.update_attributes(params[:where_factor])
        format.html { redirect_to(@where_factor, :notice => 'WhereFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_factors/1
  # DELETE /where_factors/1.xml
  def destroy
    @where_factor = WhereFactor.find(params[:id])
    @where_factor.destroy

    respond_to do |format|
      format.html { redirect_to(where_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
