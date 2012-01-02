class WhatUrlgroupsController < ApplicationController
  # GET /what_urlgroups
  # GET /what_urlgroups.xml
  def index
    @what_urlgroups = WhatUrlgroup.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @what_urlgroups }
      format.json  { render :json => @what_urlgroups }
    end
  end

  # GET /what_urlgroups/1
  # GET /what_urlgroups/1.xml
  def show
    @what_urlgroup = WhatUrlgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @what_urlgroup }
    end
  end

  # GET /what_urlgroups/new
  # GET /what_urlgroups/new.xml
  def new
    @what_urlgroup = WhatUrlgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @what_urlgroup }
    end
  end

  # GET /what_urlgroups/1/edit
  def edit
    @what_urlgroup = WhatUrlgroup.find(params[:id])
  end

  # POST /what_urlgroups
  # POST /what_urlgroups.xml
  def create
    @what_urlgroup = WhatUrlgroup.new(params[:what_urlgroup])

    respond_to do |format|
      if @what_urlgroup.save
        format.html { redirect_to(@what_urlgroup, :notice => 'WhatUrlgroup was successfully created.') }
        format.xml  { render :xml => @what_urlgroup, :status => :created, :location => @what_urlgroup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @what_urlgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /what_urlgroups/1
  # PUT /what_urlgroups/1.xml
  def update
    @what_urlgroup = WhatUrlgroup.find(params[:id])

    respond_to do |format|
      if @what_urlgroup.update_attributes(params[:what_urlgroup])
        format.html { redirect_to(@what_urlgroup, :notice => 'WhatUrlgroup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @what_urlgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /what_urlgroups/1
  # DELETE /what_urlgroups/1.xml
  def destroy
    @what_urlgroup = WhatUrlgroup.find(params[:id])
    @what_urlgroup.destroy

    respond_to do |format|
      format.html { redirect_to(what_urlgroups_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
