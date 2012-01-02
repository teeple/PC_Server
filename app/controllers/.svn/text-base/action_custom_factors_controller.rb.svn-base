class ActionCustomFactorsController < ApplicationController
  # GET /action_custom_factors
  # GET /action_custom_factors.xml
  def index
    @action_custom_factors = ActionCustomFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_custom_factors }
    end
  end

  # GET /action_custom_factors/1
  # GET /action_custom_factors/1.xml
  def show
    @action_custom_factor = ActionCustomFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_custom_factor }
    end
  end

  # GET /action_custom_factors/new
  # GET /action_custom_factors/new.xml
  def new
    @action_custom_factor = ActionCustomFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_custom_factor }
    end
  end

  # GET /action_custom_factors/1/edit
  def edit
    @action_custom_factor = ActionCustomFactor.find(params[:id])
  end

  # POST /action_custom_factors
  # POST /action_custom_factors.xml
  def create
    @action_custom_factor = ActionCustomFactor.new(params[:action_custom_factor])

    respond_to do |format|
      if @action_custom_factor.save
        format.html { redirect_to(@action_custom_factor, :notice => 'ActionCustomFactor was successfully created.') }
        format.xml  { render :xml => @action_custom_factor, :status => :created, :location => @action_custom_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_custom_factors/1
  # PUT /action_custom_factors/1.xml
  def update
    @action_custom_factor = ActionCustomFactor.find(params[:id])

    respond_to do |format|
      if @action_custom_factor.update_attributes(params[:action_custom_factor])
        format.html { redirect_to(@action_custom_factor, :notice => 'ActionCustomFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_custom_factors/1
  # DELETE /action_custom_factors/1.xml
  def destroy
    @action_custom_factor = ActionCustomFactor.find(params[:id])
    @action_custom_factor.destroy

    respond_to do |format|
      format.html { redirect_to(action_custom_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end

