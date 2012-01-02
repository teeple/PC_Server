class WhoCustomsController < ApplicationController
  # GET /who_customs
  # GET /who_customs.xml
  def index
    @who_customs = WhoCustom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_customs }
    end
  end

  # GET /who_customs/1
  # GET /who_customs/1.xml
  def show
    @who_custom = WhoCustom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_custom }
    end
  end

  # GET /who_customs/new
  # GET /who_customs/new.xml
  def new
    @who_custom = WhoCustom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_custom }
    end
  end

  # GET /who_customs/1/edit
  def edit
    @who_custom = WhoCustom.find(params[:id])
  end

  # POST /who_customs
  # POST /who_customs.xml
  def create
    @who_custom = WhoCustom.new(params[:who_custom])

    respond_to do |format|
      if @who_custom.save
        format.html { redirect_to(@who_custom, :notice => 'WhoCustom was successfully created.') }
        format.xml  { render :xml => @who_custom, :status => :created, :location => @who_custom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_customs/1
  # PUT /who_customs/1.xml
  def update
    @who_custom = WhoCustom.find(params[:id])

    respond_to do |format|
      if @who_custom.update_attributes(params[:who_custom])
        format.html { redirect_to(@who_custom, :notice => 'WhoCustom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_customs/1
  # DELETE /who_customs/1.xml
  def destroy
    @who_custom = WhoCustom.find(params[:id])
    @who_custom.destroy

    respond_to do |format|
      format.html { redirect_to(who_customs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
