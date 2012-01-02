class ActionCustomsController < ApplicationController
  include JsonMapper
  # GET /action_customs
  # GET /action_customs.xml
  def index
    @action_customs = ActionCustom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_customs }
      format.json  { render :json => @action_customs }
    end
  end

  # GET /action_customs/1
  # GET /action_customs/1.xml
  def show
    @action_custom = ActionCustom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_custom }
      format.json  { 
	  	render :json => mapping_to_hash(@action_custom, ActionCustom.json_mapping_table)
	  }
    end
  end

  # GET /action_customs/new
  # GET /action_customs/new.xml
  def new
    @action_custom = ActionCustom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_custom }
    end
  end

  # GET /action_customs/1/edit
  def edit
    @action_custom = ActionCustom.find(params[:id])
  end

  # POST /action_customs
  # POST /action_customs.xml
  def create
    @action_custom = ActionCustom.new(params[:action_custom], :order => "id DESC")

    respond_to do |format|
      if @action_custom.save
        format.html { redirect_to(@action_custom, :notice => 'ActionCustom was successfully created.') }
        format.xml  { render :xml => @action_custom, :status => :created, :location => @action_custom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_customs/1
  # PUT /action_customs/1.xml
  def update
    @action_custom = ActionCustom.find(params[:id])

    respond_to do |format|
      if @action_custom.update_attributes(params[:action_custom])
        format.html { redirect_to(@action_custom, :notice => 'ActionCustom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_custom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_customs/1
  # DELETE /action_customs/1.xml
  def destroy
    @action_custom = ActionCustom.find(params[:id])
    @action_custom.destroy

    respond_to do |format|
      format.html { redirect_to(action_customs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
