class WhereCountryFactorsController < ApplicationController
  # GET /where_country_factors
  # GET /where_country_factors.xml
  def index
    @where_country_factors = WhereCountryFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @where_country_factors }
    end
  end

  # GET /where_country_factors/1
  # GET /where_country_factors/1.xml
  def show
    @where_country_factor = WhereCountryFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_country_factor }
    end
  end

  # GET /where_country_factors/new
  # GET /where_country_factors/new.xml
  def new
    @where_country_factor = WhereCountryFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_country_factor }
    end
  end

  # GET /where_country_factors/1/edit
  def edit
    @where_country_factor = WhereCountryFactor.find(params[:id])
  end

  # POST /where_country_factors
  # POST /where_country_factors.xml
  def create
    @where_country_factor = WhereCountryFactor.new(params[:where_country_factor])

    respond_to do |format|
      if @where_country_factor.save
        format.html { redirect_to(@where_country_factor, :notice => 'WhereCountryFactor was successfully created.') }
        format.xml  { render :xml => @where_country_factor, :status => :created, :location => @where_country_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_country_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_country_factors/1
  # PUT /where_country_factors/1.xml
  def update
    @where_country_factor = WhereCountryFactor.find(params[:id])

    respond_to do |format|
      if @where_country_factor.update_attributes(params[:where_country_factor])
        format.html { redirect_to(@where_country_factor, :notice => 'WhereCountryFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_country_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_country_factors/1
  # DELETE /where_country_factors/1.xml
  def destroy
    @where_country_factor = WhereCountryFactor.find(params[:id])
    @where_country_factor.destroy

    respond_to do |format|
      format.html { redirect_to(where_country_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
