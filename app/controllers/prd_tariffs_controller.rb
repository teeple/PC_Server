class PrdTariffsController < ApplicationController
  # GET /prd_tariffs
  # GET /prd_tariffs.xml
  def index
    @prd_tariffs = PrdTariff.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_tariffs }
    end
  end

  # GET /prd_tariffs/1
  # GET /prd_tariffs/1.xml
  def show
    @prd_tariff = PrdTariff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_tariff }
    end
  end

  # GET /prd_tariffs/new
  # GET /prd_tariffs/new.xml
  def new
    @prd_tariff = PrdTariff.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_tariff }
    end
  end

  # GET /prd_tariffs/1/edit
  def edit
    @prd_tariff = PrdTariff.find(params[:id])
  end

  # POST /prd_tariffs
  # POST /prd_tariffs.xml
  def create
    @prd_tariff = PrdTariff.new(params[:prd_tariff])

    respond_to do |format|
      if @prd_tariff.save
        format.html { redirect_to(@prd_tariff, :notice => 'PrdTariff was successfully created.') }
        format.xml  { render :xml => @prd_tariff, :status => :created, :location => @prd_tariff }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_tariff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_tariffs/1
  # PUT /prd_tariffs/1.xml
  def update
    @prd_tariff = PrdTariff.find(params[:id])

    respond_to do |format|
      if @prd_tariff.update_attributes(params[:prd_tariff])
        format.html { redirect_to(@prd_tariff, :notice => 'PrdTariff was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_tariff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_tariffs/1
  # DELETE /prd_tariffs/1.xml
  def destroy
    @prd_tariff = PrdTariff.find(params[:id])
    @prd_tariff.destroy

    respond_to do |format|
      format.html { redirect_to(prd_tariffs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
