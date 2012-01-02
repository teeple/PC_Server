class WhatCustomsController < ApplicationController
  # GET /what_customs
  # GET /what_customs.xml
  def index
    @what_customs = WhatCustom.all(:include => :what_custom_factors, :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @what_customs }
    end
  end

  # GET /what_customs/1
  # GET /what_customs/1.xml
  def show
    @what_custom = WhatCustom.find(params[:id], :include => :what_custom_factors)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @what_custom }
    end
  end

  # GET /what_customs/new
  # GET /what_customs/new.xml
  def new
    @what_custom = WhatCustom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @what_custom }
    end
  end

  # GET /what_customs/1/edit
  def edit
    @what_custom = WhatCustom.find(params[:id])
  end

  # POST /what_customs
  # POST /what_customs.xml
  def create
    @what_custom = WhatCustom.new(params[:what_custom])

    respond_to do |format|
      if @what_custom.save
        format.html { redirect_to(@what_custom, :notice => 'WhatCustom was successfully created.') }
        format.xml  { render :xml => @what_custom, :status => :created, :location => @what_custom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @what_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /what_customs/1
  # PUT /what_customs/1.xml
  def update
    @what_custom = WhatCustom.find(params[:id], :include => :what_custom_factors)

    respond_to do |format|
      if @what_custom.update_attributes(params[:what_custom])
        format.html { redirect_to(@what_custom, :notice => 'WhatCustom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @what_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /what_customs/1
  # DELETE /what_customs/1.xml
  def destroy
    @what_custom = WhatCustom.find(params[:id])
    @what_custom.destroy

    respond_to do |format|
      format.html { redirect_to(what_customs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
