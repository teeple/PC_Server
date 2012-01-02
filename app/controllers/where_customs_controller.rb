class WhereCustomsController < ApplicationController
  # GET /where_customs
  # GET /where_customs.xml
  def index
    @where_customs = WhereCustom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @where_customs }
    end
  end

  # GET /where_customs/1
  # GET /where_customs/1.xml
  def show
    @where_custom = WhereCustom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_custom }
    end
  end

  # GET /where_customs/new
  # GET /where_customs/new.xml
  def new
    @where_custom = WhereCustom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_custom }
    end
  end

  # GET /where_customs/1/edit
  def edit
    @where_custom = WhereCustom.find(params[:id])
  end

  # POST /where_customs
  # POST /where_customs.xml
  def create
    @where_custom = WhereCustom.new(params[:where_custom])

    respond_to do |format|
      if @where_custom.save
        format.html { redirect_to(@where_custom, :notice => 'WhereCustom was successfully created.') }
        format.xml  { render :xml => @where_custom, :status => :created, :location => @where_custom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_customs/1
  # PUT /where_customs/1.xml
  def update
    @where_custom = WhereCustom.find(params[:id])

    respond_to do |format|
      if @where_custom.update_attributes(params[:where_custom])
        format.html { redirect_to(@where_custom, :notice => 'WhereCustom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_customs/1
  # DELETE /where_customs/1.xml
  def destroy
    @where_custom = WhereCustom.find(params[:id])
    @where_custom.destroy

    respond_to do |format|
      format.html { redirect_to(where_customs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
