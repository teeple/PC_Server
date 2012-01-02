class WhenCustomFactorsController < ApplicationController
  # GET /when_custom_factors
  # GET /when_custom_factors.xml
  def index
    @when_custom_factors = WhenCustomFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_custom_factors }
      format.json  { render :json => @when_custom_factors }
    end
  end

  # GET /when_custom_factors/1
  # GET /when_custom_factors/1.xml
  def show
    @when_custom_factor = WhenCustomFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_custom_factor }
    end
  end

  # GET /when_custom_factors/new
  # GET /when_custom_factors/new.xml
  def new
    @when_custom_factor = WhenCustomFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_custom_factor }
    end
  end

  # GET /when_custom_factors/1/edit
  def edit
    @when_custom_factor = WhenCustomFactor.find(params[:id])
  end

  # POST /when_custom_factors
  # POST /when_custom_factors.xml
  def create
    @when_custom_factor = WhenCustomFactor.new(params[:when_custom_factor])

    respond_to do |format|
      if @when_custom_factor.save
        format.html { redirect_to(@when_custom_factor, :notice => 'WhenCustomFactor was successfully created.') }
        format.xml  { render :xml => @when_custom_factor, :status => :created, :location => @when_custom_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_custom_factors/1
  # PUT /when_custom_factors/1.xml
  def update
    @when_custom_factor = WhenCustomFactor.find(params[:id])

    respond_to do |format|
      if @when_custom_factor.update_attributes(params[:when_custom_factor])
        format.html { redirect_to(@when_custom_factor, :notice => 'WhenCustomFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_custom_factors/1
  # DELETE /when_custom_factors/1.xml
  def destroy
    @when_custom_factor = WhenCustomFactor.find(params[:id])
    @when_custom_factor.destroy

    respond_to do |format|
      format.html { redirect_to(when_custom_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
