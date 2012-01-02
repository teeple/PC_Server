class CcbsProductTariffsController < ApplicationController
  # GET /ccbs_product_tariffs
  # GET /ccbs_product_tariffs.xml
  def index
    @ccbs_product_tariffs = CcbsProductTariff.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ccbs_product_tariffs }
    end
  end

  # GET /ccbs_product_tariffs/1
  # GET /ccbs_product_tariffs/1.xml
  def show
    @ccbs_product_tariff = CcbsProductTariff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ccbs_product_tariff }
    end
  end

  # GET /ccbs_product_tariffs/new
  # GET /ccbs_product_tariffs/new.xml
  def new
    @ccbs_product_tariff = CcbsProductTariff.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ccbs_product_tariff }
    end
  end

  # GET /ccbs_product_tariffs/1/edit
  def edit
    @ccbs_product_tariff = CcbsProductTariff.find(params[:id])
  end

  # POST /ccbs_product_tariffs
  # POST /ccbs_product_tariffs.xml
  def create
    @ccbs_product_tariff = CcbsProductTariff.new(params[:ccbs_product_tariff])

    respond_to do |format|
      if @ccbs_product_tariff.save
        format.html { redirect_to(@ccbs_product_tariff, :notice => 'CcbsProductTariff was successfully created.') }
        format.xml  { render :xml => @ccbs_product_tariff, :status => :created, :location => @ccbs_product_tariff }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ccbs_product_tariff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ccbs_product_tariffs/1
  # PUT /ccbs_product_tariffs/1.xml
  def update
    @ccbs_product_tariff = CcbsProductTariff.find(params[:id])

    respond_to do |format|
      if @ccbs_product_tariff.update_attributes(params[:ccbs_product_tariff])
        format.html { redirect_to(@ccbs_product_tariff, :notice => 'CcbsProductTariff was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ccbs_product_tariff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ccbs_product_tariffs/1
  # DELETE /ccbs_product_tariffs/1.xml
  def destroy
    @ccbs_product_tariff = CcbsProductTariff.find(params[:id])
    @ccbs_product_tariff.destroy

    respond_to do |format|
      format.html { redirect_to(ccbs_product_tariffs_url) }
      format.xml  { head :ok }
    end
  end
end
