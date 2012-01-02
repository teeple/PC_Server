class WhereZoneFactorsController < ApplicationController
  # GET /where_zone_factors
  # GET /where_zone_factors.xml
  def index
    @where_zone_factors = WhereZoneFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @where_zone_factors }
    end
  end

  # GET /where_zone_factors/1
  # GET /where_zone_factors/1.xml
  def show
    @where_zone_factor = WhereZoneFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_zone_factor }
    end
  end

  # GET /where_zone_factors/new
  # GET /where_zone_factors/new.xml
  def new
    @where_zone_factor = WhereZoneFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_zone_factor }
    end
  end

  # GET /where_zone_factors/1/edit
  def edit
    @where_zone_factor = WhereZoneFactor.find(params[:id])
  end

  # POST /where_zone_factors
  # POST /where_zone_factors.xml
  def create
    @where_zone_factor = WhereZoneFactor.new(params[:where_zone_factor])

    respond_to do |format|
      if @where_zone_factor.save
        format.html { redirect_to(@where_zone_factor, :notice => 'WhereZoneFactor was successfully created.') }
        format.xml  { render :xml => @where_zone_factor, :status => :created, :location => @where_zone_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_zone_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_zone_factors/1
  # PUT /where_zone_factors/1.xml
  def update
    @where_zone_factor = WhereZoneFactor.find(params[:id])

    respond_to do |format|
      if @where_zone_factor.update_attributes(params[:where_zone_factor])
        format.html { redirect_to(@where_zone_factor, :notice => 'WhereZoneFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_zone_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_zone_factors/1
  # DELETE /where_zone_factors/1.xml
  def destroy
    @where_zone_factor = WhereZoneFactor.find(params[:id])
    @where_zone_factor.destroy

    respond_to do |format|
      format.html { redirect_to(where_zone_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
