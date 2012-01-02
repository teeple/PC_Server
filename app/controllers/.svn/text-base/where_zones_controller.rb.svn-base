class WhereZonesController < ApplicationController
  # GET /where_zones
  # GET /where_zones.xml
  def index
    @where_zones = WhereZone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @where_zones }
    end
  end

  # GET /where_zones/1
  # GET /where_zones/1.xml
  def show
    @where_zone = WhereZone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_zone }
    end
  end

  # GET /where_zones/new
  # GET /where_zones/new.xml
  def new
    @where_zone = WhereZone.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_zone }
    end
  end

  # GET /where_zones/1/edit
  def edit
    @where_zone = WhereZone.find(params[:id])
  end

  # POST /where_zones
  # POST /where_zones.xml
  def create
    @where_zone = WhereZone.new(params[:where_zone])

    respond_to do |format|
      if @where_zone.save
        format.html { redirect_to(@where_zone, :notice => 'WhereZone was successfully created.') }
        format.xml  { render :xml => @where_zone, :status => :created, :location => @where_zone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_zone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_zones/1
  # PUT /where_zones/1.xml
  def update
    @where_zone = WhereZone.find(params[:id])

    respond_to do |format|
      if @where_zone.update_attributes(params[:where_zone])
        format.html { redirect_to(@where_zone, :notice => 'WhereZone was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_zone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_zones/1
  # DELETE /where_zones/1.xml
  def destroy
    @where_zone = WhereZone.find(params[:id])
    @where_zone.destroy

    respond_to do |format|
      format.html { redirect_to(where_zones_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
