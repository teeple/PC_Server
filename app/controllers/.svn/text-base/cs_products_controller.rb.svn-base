class CsProductsController < ApplicationController
  # GET /cs_products
  # GET /cs_products.xml
  def index
    @cs_products = CsProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cs_products }
    end
  end

  # GET /cs_products/1
  # GET /cs_products/1.xml
  def show
    @cs_product = CsProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cs_product }
    end
  end

  # GET /cs_products/new
  # GET /cs_products/new.xml
  def new
    @cs_product = CsProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cs_product }
    end
  end

  # GET /cs_products/1/edit
  def edit
    @cs_product = CsProduct.find(params[:id])
  end

  # POST /cs_products
  # POST /cs_products.xml
  def create
    @cs_product = CsProduct.new(params[:cs_product])

	@cs_product.crtdt = Time.new

    respond_to do |format|
      if @cs_product.save
        format.html { redirect_to(@cs_product, :notice => 'CsProduct was successfully created.') }
        format.xml  { render :xml => @cs_product, :status => :created, :location => @cs_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cs_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cs_products/1
  # PUT /cs_products/1.xml
  def update
    @cs_product = CsProduct.find(params[:id])

    respond_to do |format|
      if @cs_product.update_attributes(params[:cs_product])
        format.html { redirect_to(@cs_product, :notice => 'CsProduct was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cs_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cs_products/1
  # DELETE /cs_products/1.xml
  def destroy
    @cs_product = CsProduct.find(params[:id])
    @cs_product.destroy

    respond_to do |format|
      format.html { redirect_to(cs_products_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
