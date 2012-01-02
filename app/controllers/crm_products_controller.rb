class CrmProductsController < ApplicationController
  # GET /crm_products
  # GET /crm_products.xml
  def index
    @crm_products = CrmProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @crm_products }
      format.json  { render :json => @crm_products }
    end
  end

  # GET /crm_products/1
  # GET /crm_products/1.xml
  def show
    # @crm_product = CrmProduct.find(params[:id])

    prd_attribute = PrdAttribute.find(params[:id], :include => :products)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @crm_product }
      format.json  { 
          crm_product = CrmProduct.new
          crm_product.set_fields(prd_attribute)
          results = mapping_to_hash(crm_product, CrmProduct.json_mapping_table)
          crm_product.send_to_crm('POST', results.to_json)
          render :json => crm_product 
      }
    end
  end

  # GET /crm_products/new
  # GET /crm_products/new.xml
  def new
    @crm_product = CrmProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crm_product }
    end
  end

  # GET /crm_products/1/edit
  def edit
    @crm_product = CrmProduct.find(params[:id])
  end

  # POST /crm_products
  # POST /crm_products.xml
  def create
    @crm_product = CrmProduct.new(params[:crm_product])

    respond_to do |format|
      if @crm_product.save
        format.html { redirect_to(@crm_product, :notice => 'CrmProduct was successfully created.') }
        format.xml  { render :xml => @crm_product, :status => :created, :location => @crm_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crm_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crm_products/1
  # PUT /crm_products/1.xml
  def update
    @crm_product = CrmProduct.find(params[:id])

    respond_to do |format|
      if @crm_product.update_attributes(params[:crm_product])
        format.html { redirect_to(@crm_product, :notice => 'CrmProduct was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crm_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crm_products/1
  # DELETE /crm_products/1.xml
  def destroy
    @crm_product = CrmProduct.find(params[:id])
    @crm_product.destroy

    respond_to do |format|
      format.html { redirect_to(crm_products_url) }
      format.xml  { head :ok }
    end
  end
end
