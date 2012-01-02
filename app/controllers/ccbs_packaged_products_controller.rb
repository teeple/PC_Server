class CcbsPackagedProductsController < ApplicationController
  # GET /ccbs_packaged_products
  # GET /ccbs_packaged_products.xml
  def index
    @ccbs_packaged_products = CcbsPackagedProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ccbs_packaged_products }
    end
  end

  # GET /ccbs_packaged_products/1
  # GET /ccbs_packaged_products/1.xml
  def show
    @ccbs_packaged_product = CcbsPackagedProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ccbs_packaged_product }
    end
  end

  # GET /ccbs_packaged_products/new
  # GET /ccbs_packaged_products/new.xml
  def new
    @ccbs_packaged_product = CcbsPackagedProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ccbs_packaged_product }
    end
  end

  # GET /ccbs_packaged_products/1/edit
  def edit
    @ccbs_packaged_product = CcbsPackagedProduct.find(params[:id])
  end

  # POST /ccbs_packaged_products
  # POST /ccbs_packaged_products.xml
  def create
    @ccbs_packaged_product = CcbsPackagedProduct.new(params[:ccbs_packaged_product])

    respond_to do |format|
      if @ccbs_packaged_product.save
        format.html { redirect_to(@ccbs_packaged_product, :notice => 'CcbsPackagedProduct was successfully created.') }
        format.xml  { render :xml => @ccbs_packaged_product, :status => :created, :location => @ccbs_packaged_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ccbs_packaged_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ccbs_packaged_products/1
  # PUT /ccbs_packaged_products/1.xml
  def update
    @ccbs_packaged_product = CcbsPackagedProduct.find(params[:id])

    respond_to do |format|
      if @ccbs_packaged_product.update_attributes(params[:ccbs_packaged_product])
        format.html { redirect_to(@ccbs_packaged_product, :notice => 'CcbsPackagedProduct was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ccbs_packaged_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ccbs_packaged_products/1
  # DELETE /ccbs_packaged_products/1.xml
  def destroy
    @ccbs_packaged_product = CcbsPackagedProduct.find(params[:id])
    @ccbs_packaged_product.destroy

    respond_to do |format|
      format.html { redirect_to(ccbs_packaged_products_url) }
      format.xml  { head :ok }
    end
  end
end
