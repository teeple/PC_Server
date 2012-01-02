class AdditionalServicesController < ApplicationController
  include JsonMapper

  # GET /additional_services
  # GET /additional_services.xml
  def index
    @additional_services = AdditionalService.all(:include => :currency_factor, :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @additional_services }
      format.json  { 
	  	
		@returns = []
		@additional_services.each do |node|
			@returns << mapping_to_hash(node, AdditionalService.json_mapping_table)
		end 

	  	render :json => @returns
	  }
    end
  end

  # GET /additional_services/1
  # GET /additional_services/1.xml
  def show
    @additional_service = AdditionalService.find(params[:id], :include => :currency_factor)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @additional_service }
      format.json  { render :json => @additional_service }
    end
  end

  # GET /additional_services/new
  # GET /additional_services/new.xml
  def new
    @additional_service = AdditionalService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @additional_service }
    end
  end

  # GET /additional_services/1/edit
  def edit
    @additional_service = AdditionalService.find(params[:id])
  end

  # POST /additional_services
  # POST /additional_services.xml
  def create
  	if params[:format] == "json" 
		temp_additional_service = params[:additional_service]
		temp_additional_service["currency_factor_id"] = params[:additional_service][:currency]
		temp_additional_service.delete('currency')
    	@additional_service = AdditionalService.new(temp_additional_service)
	else
    	@additional_service = AdditionalService.new(params[:additional_service])
	end

    respond_to do |format|
      if @additional_service.save
        format.html { redirect_to(@additional_service, :notice => 'AdditionalService was successfully created.') }
        format.xml  { render :xml => @additional_service, :status => :created, :location => @additional_service }
        format.json  { render :json => @additional_service, :status => :created, :location => @additional_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @additional_service.errors, :status => :unprocessable_entity }
        format.json  { render :json => @additional_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /additional_services/1
  # PUT /additional_services/1.xml
  def update
    @additional_service = AdditionalService.find(params[:id])

	if params[:format] == "json" 
		temp_additional_service = params[:additional_service]
		temp_additional_service["currency_factor_id"] = params[:additional_service][:currency]
		temp_additional_service.delete('currency')
	else
    	temp_additional_service = params[:additional_service]
	end

    respond_to do |format|
      if @additional_service.update_attributes(temp_additional_service)
        format.html { redirect_to(@additional_service, :notice => 'AdditionalService was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @additional_service.errors, :status => :unprocessable_entity }
        format.json  { render :json => @additional_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_services/1
  # DELETE /additional_services/1.xml
  def destroy
    @additional_service = AdditionalService.find(params[:id])
    @additional_service.destroy

    respond_to do |format|
      format.html { redirect_to(additional_services_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
