class CcbsProductsController < ApplicationController
  # GET /ccbs_products
  # GET /ccbs_products.xml
  def index
    @ccbs_products = CcbsProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ccbs_products }
      format.json  { render :json => @ccbs_products }
    end
  end

  # GET /ccbs_products/1
  # GET /ccbs_products/1.xml
  def show
    # @ccbs_product = CcbsProduct.find(params[:id])

    prd_attribute   = PrdAttribute.find(params[:id], :include => :products)
    product         = Product.find(prd_attribute.products[0].id, :include => [:prd_subscriptions, :prd_additional_services])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ccbs_product }
      format.json {

          ccbs_product = CcbsProduct.new
          tariff_list = ccbs_product.set_fields(prd_attribute, product.prd_subscriptions, product.prd_additional_services)

          # product에 대해 전달
          results = mapping_to_hash(ccbs_product,CcbsProduct.json_mapping_table)
          ccbs_product.send_to_ccbs('POST', results.to_json)

          # tariff에 대해서 전달
          tariff_list.each { |product_tariff|         
                to_ccbs_hash = mapping_to_hash(product_tariff, CcbsProductTariff.json_mapping_table)
                product_tariff.send_to_ccbs("POST", to_ccbs_hash.to_json)                 }

          render :json => results
      } 
    end
  end

  # GET /ccbs_products/new
  # GET /ccbs_products/new.xml
  def new
    @ccbs_product = CcbsProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ccbs_product }
    end
  end

  # GET /ccbs_products/1/edit
  def edit
    @ccbs_product = CcbsProduct.find(params[:id])
  end

  # POST /ccbs_products
  # POST /ccbs_products.xml
  def create
    @ccbs_product = CcbsProduct.new(params[:ccbs_product])

    respond_to do |format|
      if @ccbs_product.save
        format.html { redirect_to(@ccbs_product, :notice => 'CcbsProduct was successfully created.') }
        format.xml  { render :xml => @ccbs_product, :status => :created, :location => @ccbs_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ccbs_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ccbs_products/1
  # PUT /ccbs_products/1.xml
  def update
    @ccbs_product = CcbsProduct.find(params[:id])

    respond_to do |format|
      if @ccbs_product.update_attributes(params[:ccbs_product])
        format.html { redirect_to(@ccbs_product, :notice => 'CcbsProduct was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ccbs_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ccbs_products/1
  # DELETE /ccbs_products/1.xml
  def destroy
    @ccbs_product = CcbsProduct.find(params[:id])
    @ccbs_product.destroy

    respond_to do |format|
      format.html { redirect_to(ccbs_products_url) }
      format.xml  { head :ok }
    end
  end
end
