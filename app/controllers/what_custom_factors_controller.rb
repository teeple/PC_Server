class WhatCustomFactorsController < ApplicationController
  # GET /what_custom_factors
  # GET /what_custom_factors.xml
  def index
    @what_custom_factors = WhatCustomFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @what_custom_factors }
    end
  end

  # GET /what_custom_factors/1
  # GET /what_custom_factors/1.xml
  def show
    @what_custom_factor = WhatCustomFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @what_custom_factor }
    end
  end

  # GET /what_custom_factors/new
  # GET /what_custom_factors/new.xml
  def new
    @what_custom_factor = WhatCustomFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @what_custom_factor }
    end
  end

  # GET /what_custom_factors/1/edit
  def edit
    @what_custom_factor = WhatCustomFactor.find(params[:id])
  end

  # POST /what_custom_factors
  # POST /what_custom_factors.xml
  def create
    @what_custom_factor = WhatCustomFactor.new(params[:what_custom_factor])

    respond_to do |format|
      if @what_custom_factor.save
        format.html { redirect_to(@what_custom_factor, :notice => 'WhatCustomFactor was successfully created.') }
        format.xml  { render :xml => @what_custom_factor, :status => :created, :location => @what_custom_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @what_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /what_custom_factors/1
  # PUT /what_custom_factors/1.xml
  def update
    @what_custom_factor = WhatCustomFactor.find(params[:id])

    respond_to do |format|
      if @what_custom_factor.update_attributes(params[:what_custom_factor])
        format.html { redirect_to(@what_custom_factor, :notice => 'WhatCustomFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @what_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /what_custom_factors/1
  # DELETE /what_custom_factors/1.xml
  def destroy
    @what_custom_factor = WhatCustomFactor.find(params[:id])
    @what_custom_factor.destroy

    respond_to do |format|
      format.html { redirect_to(what_custom_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
