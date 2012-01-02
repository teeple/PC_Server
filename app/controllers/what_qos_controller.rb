class WhatQosController < ApplicationController
  # GET /what_qos
  # GET /what_qos.xml
  def index
    @what_qos = WhatQo.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @what_qos }
      format.json  { render :json => @what_qos }
    end
  end

  # GET /what_qos/1
  # GET /what_qos/1.xml
  def show
    @what_qo = WhatQo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @what_qo }
    end
  end

  # GET /what_qos/new
  # GET /what_qos/new.xml
  def new
    @what_qo = WhatQo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @what_qo }
    end
  end

  # GET /what_qos/1/edit
  def edit
    @what_qo = WhatQo.find(params[:id])
  end

  # POST /what_qos
  # POST /what_qos.xml
  def create
    @what_qo = WhatQo.new(params[:what_qo])

    respond_to do |format|
      if @what_qo.save
        format.html { redirect_to(@what_qo, :notice => 'WhatQo was successfully created.') }
        format.xml  { render :xml => @what_qo, :status => :created, :location => @what_qo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @what_qo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /what_qos/1
  # PUT /what_qos/1.xml
  def update
    @what_qo = WhatQo.find(params[:id])

    respond_to do |format|
      if @what_qo.update_attributes(params[:what_qo])
        format.html { redirect_to(@what_qo, :notice => 'WhatQo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @what_qo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /what_qos/1
  # DELETE /what_qos/1.xml
  def destroy
    @what_qo = WhatQo.find(params[:id])
    @what_qo.destroy

    respond_to do |format|
      format.html { redirect_to(what_qos_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
