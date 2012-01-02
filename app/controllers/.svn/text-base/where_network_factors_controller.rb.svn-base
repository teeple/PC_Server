class WhereNetworkFactorsController < ApplicationController
  # GET /where_network_factors
  # GET /where_network_factors.xml
  def index
    @where_network_factors = WhereNetworkFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @where_network_factors }
    end
  end

  # GET /where_network_factors/1
  # GET /where_network_factors/1.xml
  def show
    @where_network_factor = WhereNetworkFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_network_factor }
    end
  end

  # GET /where_network_factors/new
  # GET /where_network_factors/new.xml
  def new
    @where_network_factor = WhereNetworkFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_network_factor }
    end
  end

  # GET /where_network_factors/1/edit
  def edit
    @where_network_factor = WhereNetworkFactor.find(params[:id])
  end

  # POST /where_network_factors
  # POST /where_network_factors.xml
  def create
    @where_network_factor = WhereNetworkFactor.new(params[:where_network_factor])

    respond_to do |format|
      if @where_network_factor.save
        format.html { redirect_to(@where_network_factor, :notice => 'WhereNetworkFactor was successfully created.') }
        format.xml  { render :xml => @where_network_factor, :status => :created, :location => @where_network_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_network_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_network_factors/1
  # PUT /where_network_factors/1.xml
  def update
    @where_network_factor = WhereNetworkFactor.find(params[:id])

    respond_to do |format|
      if @where_network_factor.update_attributes(params[:where_network_factor])
        format.html { redirect_to(@where_network_factor, :notice => 'WhereNetworkFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_network_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_network_factors/1
  # DELETE /where_network_factors/1.xml
  def destroy
    @where_network_factor = WhereNetworkFactor.find(params[:id])
    @where_network_factor.destroy

    respond_to do |format|
      format.html { redirect_to(where_network_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
