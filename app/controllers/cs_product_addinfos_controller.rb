class CsProductAddinfosController < ApplicationController
  # GET /cs_product_addinfos
  # GET /cs_product_addinfos.xml
  def index
    @cs_product_addinfos = CsProductAddinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cs_product_addinfos }
    end
  end

  # GET /cs_product_addinfos/1
  # GET /cs_product_addinfos/1.xml
  def show
    @cs_product_addinfo = CsProductAddinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cs_product_addinfo }
    end
  end

  # GET /cs_product_addinfos/new
  # GET /cs_product_addinfos/new.xml
  def new
    @cs_product_addinfo = CsProductAddinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cs_product_addinfo }
    end
  end

  # GET /cs_product_addinfos/1/edit
  def edit
    @cs_product_addinfo = CsProductAddinfo.find(params[:id])
  end

  # POST /cs_product_addinfos
  # POST /cs_product_addinfos.xml
  def create
    @cs_product_addinfo = CsProductAddinfo.new(params[:cs_product_addinfo])

    respond_to do |format|
      if @cs_product_addinfo.save
        format.html { redirect_to(@cs_product_addinfo, :notice => 'CsProductAddinfo was successfully created.') }
        format.xml  { render :xml => @cs_product_addinfo, :status => :created, :location => @cs_product_addinfo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cs_product_addinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cs_product_addinfos/1
  # PUT /cs_product_addinfos/1.xml
  def update
    @cs_product_addinfo = CsProductAddinfo.find(params[:id])

    respond_to do |format|
      if @cs_product_addinfo.update_attributes(params[:cs_product_addinfo])
        format.html { redirect_to(@cs_product_addinfo, :notice => 'CsProductAddinfo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cs_product_addinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cs_product_addinfos/1
  # DELETE /cs_product_addinfos/1.xml
  def destroy
    @cs_product_addinfo = CsProductAddinfo.find(params[:id])
    @cs_product_addinfo.destroy

    respond_to do |format|
      format.html { redirect_to(cs_product_addinfos_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
