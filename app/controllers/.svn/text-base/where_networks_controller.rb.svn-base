class WhereNetworksController < ApplicationController
  # GET /where_networks
  # GET /where_networks.xml
  def index
    @where_networks = WhereNetwork.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @where_networks }
    end
  end

  # GET /where_networks/1
  # GET /where_networks/1.xml
  def show
    @where_network = WhereNetwork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_network }
    end
  end

  # GET /where_networks/new
  # GET /where_networks/new.xml
  def new
    @where_network = WhereNetwork.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_network }
    end
  end

  # GET /where_networks/1/edit
  def edit
    @where_network = WhereNetwork.find(params[:id])
  end

  # POST /where_networks
  # POST /where_networks.xml
  def create
    @where_network = WhereNetwork.new(params[:where_network])

    respond_to do |format|
      if @where_network.save
        format.html { redirect_to(@where_network, :notice => 'WhereNetwork was successfully created.') }
        format.xml  { render :xml => @where_network, :status => :created, :location => @where_network }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_network.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_networks/1
  # PUT /where_networks/1.xml
  def update
    @where_network = WhereNetwork.find(params[:id])

    respond_to do |format|
      if @where_network.update_attributes(params[:where_network])
        format.html { redirect_to(@where_network, :notice => 'WhereNetwork was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_network.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_networks/1
  # DELETE /where_networks/1.xml
  def destroy
    @where_network = WhereNetwork.find(params[:id])
    @where_network.destroy

    respond_to do |format|
      format.html { redirect_to(where_networks_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
