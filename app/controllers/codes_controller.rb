class CodesController < ApplicationController
  include JsonMapper
  # GET /codes
  # GET /codes.xml
  def index
    @codes = Code.all(:include => :code_factors, :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @codes }
      format.json  {

	  	@returns = Hash.new
		temp_array = []
		@codes.each do |factor|
			temp_array << mapping_to_hash(factor, Code.json_mapping_table)
		end 

	  	render :json => temp_array
	  }
	  format.rule {

	  	@returns = []
		@codes.each do |code|
			@code = code
			@ruleset_enum = code.data_to_ruleset_enum
			tmpl_file_name = TMPL_PATH + RULE['Code']['tmpl']
			output_enum = render_to_string(:file => tmpl_file_name)

			rule_file_name = RULE_PATH + RULE['Code'][code.name]['rule']
			save_to_ruleset_enum(rule_file_name, output_enum)
			@returns << output_enum
		end 

		rule_file_name = RULE_PATH + RULE['Country']['rule']
		temp_array = []
		temp_array << "[ENUM_COUNTRY]"
		temp_array << "country"
		COUNTRY_CODES['countries']['codeTable'].each do |country|
			temp_array << (country['index'].to_s + "\t" + country['code2'])
		end 
		save_to_ruleset_enum(rule_file_name, temp_array.join("\n"))

		render :rule => @returns 
	  }
    end
  end

  def save_to_ruleset_enum(file_name, output_enum)
	File.delete(file_name) if File.exist?(file_name)

  	file = File.new(file_name, "w")
	file << output_enum
	file.close
  end

  # GET /codes/1
  # GET /codes/1.xml
  def show
    @code = Code.find(params[:id], :include => :code_factors)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @code }
      format.json  { 
	  	render :json => mapping_to_hash(@code, Code.json_mapping_table)
	  }
    end
  end

  # GET /codes/new
  # GET /codes/new.xml
  def new
    @code = Code.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @code }
    end
  end

  # GET /codes/1/edit
  def edit
    @code = Code.find(params[:id])
  end

  # POST /codes
  # POST /codes.xml
  def create
    @code = Code.new(params[:code])

    respond_to do |format|
      if @code.save
        format.html { redirect_to(@code, :notice => 'Code was successfully created.') }
        format.xml  { render :xml => @code, :status => :created, :location => @code }
        format.json  {
			params['factors'].each do |factor|
				code_factor = CodeFactor.new
				code_factor.name = factor.name
				code_factor.code_id = @code.id
				code_factor.save 
			end 

			render :json => mapping_to_hash(@code, Code.json_mapping_table), :status => :created, :location => @code 
		}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
        format.json  { render :json => @code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /codes/1
  # PUT /codes/1.xml
  def update
    @code = Code.find(params[:id])

    respond_to do |format|
      if @code.update_attributes(params[:code])
        format.html { redirect_to(@code, :notice => 'Code was successfully updated.') }
        format.xml  { head :ok }
        format.json  {
			parmas['factors'].each do |factor|
				code_factor = CodeFactor.new
				code_factor.name = factor.name
				code_factor.code_id = @code.id
				code_factor.save
			end 

			head :ok 
		}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
        format.json  { render :json => @code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.xml
  def destroy
    @code = Code.find(params[:id])
    @code.destroy

    respond_to do |format|
      format.html { redirect_to(codes_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
