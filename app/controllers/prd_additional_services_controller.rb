class PrdAdditionalServicesController < ApplicationController
  # GET /prd_additional_services
  # GET /prd_additional_services.xml
  def index
    @prd_additional_services = PrdAdditionalService.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_additional_services }
      format.json  { render :json => @prd_additional_services }
    end
  end

  # GET /prd_additional_services/1
  # GET /prd_additional_services/1.xml
  def show
    @prd_additional_service = PrdAdditionalService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_additional_service }
    end
  end

  # GET /prd_additional_services/new
  # GET /prd_additional_services/new.xml
  def new
    @prd_additional_service = PrdAdditionalService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_additional_service }
    end
  end

  # GET /prd_additional_services/1/edit
  def edit
    @prd_additional_service = PrdAdditionalService.find(params[:id])
  end

  # POST /prd_additional_services
  # POST /prd_additional_services.xml
  def create
    @prd_additional_service = PrdAdditionalService.new(params[:prd_additional_service])

    respond_to do |format|
      if @prd_additional_service.save
        format.html { redirect_to(@prd_additional_service, :notice => 'PrdAdditionalService was successfully created.') }
        format.xml  { render :xml => @prd_additional_service, :status => :created, :location => @prd_additional_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_additional_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_additional_services/1
  # PUT /prd_additional_services/1.xml
  def update
    @prd_additional_service = PrdAdditionalService.find(params[:id])

    respond_to do |format|
      if @prd_additional_service.update_attributes(params[:prd_additional_service])
        format.html { redirect_to(@prd_additional_service, :notice => 'PrdAdditionalService was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_additional_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_additional_services/1
  # DELETE /prd_additional_services/1.xml
  def destroy
    @prd_additional_service = PrdAdditionalService.find(params[:id])
    @prd_additional_service.destroy

    respond_to do |format|
      format.html { redirect_to(prd_additional_services_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end