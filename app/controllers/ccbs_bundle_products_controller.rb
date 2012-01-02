class CcbsBundleProductsController < ApplicationController
  # GET /ccbs_bundle_products
  # GET /ccbs_bundle_products.xml
  def index
    @ccbs_bundle_products = CcbsBundleProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ccbs_bundle_products }
      format.json  { render :json => @ccbs_bundle_products }
    end
  end

  # GET /ccbs_bundle_products/1
  # GET /ccbs_bundle_products/1.xml
  def show
    #@ccbs_bundle_product = CcbsBundleProduct.find(params[:id])

    prd_attribute = PrdAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ccbs_bundle_product }
      format.json  { 

          ccbs_bundle_product = CcbsBundleProduct.new
          ccbs_bundle_product.set_fields(prd_attribute)

          results = mapping_to_hash(ccbs_bundle_product, CcbsBundleProduct.json_mapping_table)
          ccbs_bundle_product.send_to_ccbs('POST', results.to_json)

          render :json => results
      }
    end
  end

  # GET /ccbs_bundle_products/new
  # GET /ccbs_bundle_products/new.xml
  def new
    @ccbs_bundle_product = CcbsBundleProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ccbs_bundle_product }
    end
  end

  # GET /ccbs_bundle_products/1/edit
  def edit
    @ccbs_bundle_product = CcbsBundleProduct.find(params[:id])
  end

  # POST /ccbs_bundle_products
  # POST /ccbs_bundle_products.xml
  def create
    @ccbs_bundle_product = CcbsBundleProduct.new(params[:ccbs_bundle_product])

    respond_to do |format|
      if @ccbs_bundle_product.save
        format.html { redirect_to(@ccbs_bundle_product, :notice => 'CcbsBundleProduct was successfully created.') }
        format.xml  { render :xml => @ccbs_bundle_product, :status => :created, :location => @ccbs_bundle_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ccbs_bundle_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ccbs_bundle_products/1
  # PUT /ccbs_bundle_products/1.xml
  def update
    @ccbs_bundle_product = CcbsBundleProduct.find(params[:id])

    respond_to do |format|
      if @ccbs_bundle_product.update_attributes(params[:ccbs_bundle_product])
        format.html { redirect_to(@ccbs_bundle_product, :notice => 'CcbsBundleProduct was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ccbs_bundle_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ccbs_bundle_products/1
  # DELETE /ccbs_bundle_products/1.xml
  def destroy
    @ccbs_bundle_product = CcbsBundleProduct.find(params[:id])
    @ccbs_bundle_product.destroy

    respond_to do |format|
      format.html { redirect_to(ccbs_bundle_products_url) }
      format.xml  { head :ok }
    end
  end
end
