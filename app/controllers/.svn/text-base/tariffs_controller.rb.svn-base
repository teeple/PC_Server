class TariffsController < ApplicationController
  # GET /tariffs
  # GET /tariffs.xml
  def index
    @tariffs = Tariff.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tariffs }
	  format.rule {

		@tariffs_output  = []
	  	@tariffs.each do |tariff|
			@tariffs_output << tariff.name + ": " + tariff.data_to_ruleset 
		end 
		@tariffs_output = @tariffs_output.join("\n")

		output = render_to_string(:file => TMPL_PATH + RULE['Tariff']['tmpl'])
		save_to_ruleset(output)

	  	render :rule => @tariffs_output 
	  }
    end
  end

  def save_to_ruleset(output)
  	file_name = RULE_PATH + RULE['Tariff']['rule']
	File.delete(file_name) if File.exist?(file_name)

  	file = File.new(file_name, "w")
	file << output
	file.close
  end

  # GET /tariffs/1
  # GET /tariffs/1.xml
  def show
    @tariff = Tariff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tariff }
    end
  end

  # GET /tariffs/new
  # GET /tariffs/new.xml
  def new
    @tariff = Tariff.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tariff }
    end
  end

  # GET /tariffs/1/edit
  def edit
    @tariff = Tariff.find(params[:id])
  end

  # POST /tariffs
  # POST /tariffs.xml
  def create
    @tariff = Tariff.new(params[:tariff])

    respond_to do |format|
      if @tariff.save
        format.html { redirect_to(@tariff, :notice => 'Tariff was successfully created.') }
        format.xml  { render :xml => @tariff, :status => :created, :location => @tariff }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tariff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tariffs/1
  # PUT /tariffs/1.xml
  def update
    @tariff = Tariff.find(params[:id])

    respond_to do |format|
      if @tariff.update_attributes(params[:tariff])
        format.html { redirect_to(@tariff, :notice => 'Tariff was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tariff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tariffs/1
  # DELETE /tariffs/1.xml
  def destroy
    @tariff = Tariff.find(params[:id])
    @tariff.destroy

    respond_to do |format|
      format.html { redirect_to(tariffs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
