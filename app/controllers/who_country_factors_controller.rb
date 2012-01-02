class WhoCountryFactorsController < ApplicationController
  # GET /who_country_factors
  # GET /who_country_factors.xml
  def index
    @who_country_factors = WhoCountryFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_country_factors }
    end
  end

  # GET /who_country_factors/1
  # GET /who_country_factors/1.xml
  def show
    @who_country_factor = WhoCountryFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_country_factor }
    end
  end

  # GET /who_country_factors/new
  # GET /who_country_factors/new.xml
  def new
    @who_country_factor = WhoCountryFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_country_factor }
    end
  end

  # GET /who_country_factors/1/edit
  def edit
    @who_country_factor = WhoCountryFactor.find(params[:id])
  end

  # POST /who_country_factors
  # POST /who_country_factors.xml
  def create
    @who_country_factor = WhoCountryFactor.new(params[:who_country_factor])

    respond_to do |format|
      if @who_country_factor.save
        format.html { redirect_to(@who_country_factor, :notice => 'WhoCountryFactor was successfully created.') }
        format.xml  { render :xml => @who_country_factor, :status => :created, :location => @who_country_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_country_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_country_factors/1
  # PUT /who_country_factors/1.xml
  def update
    @who_country_factor = WhoCountryFactor.find(params[:id])

    respond_to do |format|
      if @who_country_factor.update_attributes(params[:who_country_factor])
        format.html { redirect_to(@who_country_factor, :notice => 'WhoCountryFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_country_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_country_factors/1
  # DELETE /who_country_factors/1.xml
  def destroy
    @who_country_factor = WhoCountryFactor.find(params[:id])
    @who_country_factor.destroy

    respond_to do |format|
      format.html { redirect_to(who_country_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
