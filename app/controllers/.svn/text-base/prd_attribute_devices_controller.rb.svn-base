class PrdAttributeDevicesController < ApplicationController
  # GET /prd_attribute_devices
  # GET /prd_attribute_devices.xml
  def index
    @prd_attribute_devices = PrdAttributeDevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_attribute_devices }
    end
  end

  # GET /prd_attribute_devices/1
  # GET /prd_attribute_devices/1.xml
  def show
    @prd_attribute_device = PrdAttributeDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_attribute_device }
    end
  end

  # GET /prd_attribute_devices/new
  # GET /prd_attribute_devices/new.xml
  def new
    @prd_attribute_device = PrdAttributeDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_attribute_device }
    end
  end

  # GET /prd_attribute_devices/1/edit
  def edit
    @prd_attribute_device = PrdAttributeDevice.find(params[:id])
  end

  # POST /prd_attribute_devices
  # POST /prd_attribute_devices.xml
  def create
    @prd_attribute_device = PrdAttributeDevice.new(params[:prd_attribute_device])

    respond_to do |format|
      if @prd_attribute_device.save
        format.html { redirect_to(@prd_attribute_device, :notice => 'PrdAttributeDevice was successfully created.') }
        format.xml  { render :xml => @prd_attribute_device, :status => :created, :location => @prd_attribute_device }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_attribute_device.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_attribute_devices/1
  # PUT /prd_attribute_devices/1.xml
  def update
    @prd_attribute_device = PrdAttributeDevice.find(params[:id])

    respond_to do |format|
      if @prd_attribute_device.update_attributes(params[:prd_attribute_device])
        format.html { redirect_to(@prd_attribute_device, :notice => 'PrdAttributeDevice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_attribute_device.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_attribute_devices/1
  # DELETE /prd_attribute_devices/1.xml
  def destroy
    @prd_attribute_device = PrdAttributeDevice.find(params[:id])
    @prd_attribute_device.destroy

    respond_to do |format|
      format.html { redirect_to(prd_attribute_devices_url) }
      format.xml  { head :ok }
    end
  end
end
