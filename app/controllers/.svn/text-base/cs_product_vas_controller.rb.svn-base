class CsProductVasController < ApplicationController
  # GET /cs_product_vas
  # GET /cs_product_vas.xml
  def index
    @cs_product_vas = CsProductVa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cs_product_vas }
    end
  end

  # GET /cs_product_vas/1
  # GET /cs_product_vas/1.xml
  def show
    @cs_product_va = CsProductVa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cs_product_va }
    end
  end

  # GET /cs_product_vas/new
  # GET /cs_product_vas/new.xml
  def new
    @cs_product_va = CsProductVa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cs_product_va }
    end
  end

  # GET /cs_product_vas/1/edit
  def edit
    @cs_product_va = CsProductVa.find(params[:id])
  end

  # POST /cs_product_vas
  # POST /cs_product_vas.xml
  def create
    @cs_product_va = CsProductVa.new(params[:cs_product_va])

    respond_to do |format|
      if @cs_product_va.save
        format.html { redirect_to(@cs_product_va, :notice => 'CsProductVa was successfully created.') }
        format.xml  { render :xml => @cs_product_va, :status => :created, :location => @cs_product_va }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cs_product_va.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cs_product_vas/1
  # PUT /cs_product_vas/1.xml
  def update
    @cs_product_va = CsProductVa.find(params[:id])

    respond_to do |format|
      if @cs_product_va.update_attributes(params[:cs_product_va])
        format.html { redirect_to(@cs_product_va, :notice => 'CsProductVa was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cs_product_va.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cs_product_vas/1
  # DELETE /cs_product_vas/1.xml
  def destroy
    @cs_product_va = CsProductVa.find(params[:id])
    @cs_product_va.destroy

    respond_to do |format|
      format.html { redirect_to(cs_product_vas_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
