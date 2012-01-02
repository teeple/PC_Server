class WhatUrlgroupFactorsController < ApplicationController
  # GET /what_urlgroup_factors
  # GET /what_urlgroup_factors.xml
  def index
    @what_urlgroup_factors = WhatUrlgroupFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @what_urlgroup_factors }
      format.json  { render :json => @what_urlgroup_factors }
    end
  end

  # GET /what_urlgroup_factors/1
  # GET /what_urlgroup_factors/1.xml
  def show
    @what_urlgroup_factor = WhatUrlgroupFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @what_urlgroup_factor }
    end
  end

  # GET /what_urlgroup_factors/new
  # GET /what_urlgroup_factors/new.xml
  def new
    @what_urlgroup_factor = WhatUrlgroupFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @what_urlgroup_factor }
    end
  end

  # GET /what_urlgroup_factors/1/edit
  def edit
    @what_urlgroup_factor = WhatUrlgroupFactor.find(params[:id])
  end

  # POST /what_urlgroup_factors
  # POST /what_urlgroup_factors.xml
  def create
    @what_urlgroup_factor = WhatUrlgroupFactor.new(params[:what_urlgroup_factor])

    respond_to do |format|
      if @what_urlgroup_factor.save
        format.html { redirect_to(@what_urlgroup_factor, :notice => 'WhatUrlgroupFactor was successfully created.') }
        format.xml  { render :xml => @what_urlgroup_factor, :status => :created, :location => @what_urlgroup_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @what_urlgroup_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /what_urlgroup_factors/1
  # PUT /what_urlgroup_factors/1.xml
  def update
    @what_urlgroup_factor = WhatUrlgroupFactor.find(params[:id])

    respond_to do |format|
      if @what_urlgroup_factor.update_attributes(params[:what_urlgroup_factor])
        format.html { redirect_to(@what_urlgroup_factor, :notice => 'WhatUrlgroupFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @what_urlgroup_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /what_urlgroup_factors/1
  # DELETE /what_urlgroup_factors/1.xml
  def destroy
    @what_urlgroup_factor = WhatUrlgroupFactor.find(params[:id])
    @what_urlgroup_factor.destroy

    respond_to do |format|
      format.html { redirect_to(what_urlgroup_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
