class WhenCustomsController < ApplicationController
  # GET /when_customs
  # GET /when_customs.xml
  def index
    @when_customs = WhenCustom.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @when_customs }
      format.json  { render :json => @when_customs }
      format.rule  { render :rule => @when_customs }
    end
  end

  # GET /when_customs/1
  # GET /when_customs/1.xml
  def show
    @when_custom = WhenCustom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @when_custom }
      format.json  { render :json => @when_customs }
      format.rule  { render :rule => @when_customs }
    end
  end

  # GET /when_customs/new
  # GET /when_customs/new.xml
  def new
    @when_custom = WhenCustom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @when_custom }
    end
  end

  # GET /when_customs/1/edit
  def edit
    @when_custom = WhenCustom.find(params[:id])
  end

  # POST /when_customs
  # POST /when_customs.xml
  def create
    @when_custom = WhenCustom.new(params[:when_custom])

    respond_to do |format|
      if @when_custom.save
        format.html { redirect_to(@when_custom, :notice => 'WhenCustom was successfully created.') }
        format.xml  { render :xml => @when_custom, :status => :created, :location => @when_custom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @when_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /when_customs/1
  # PUT /when_customs/1.xml
  def update
    @when_custom = WhenCustom.find(params[:id])

    respond_to do |format|
      if @when_custom.update_attributes(params[:when_custom])
        format.html { redirect_to(@when_custom, :notice => 'WhenCustom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @when_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /when_customs/1
  # DELETE /when_customs/1.xml
  def destroy
    @when_custom = WhenCustom.find(params[:id])
    @when_custom.destroy

    respond_to do |format|
      format.html { redirect_to(when_customs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
