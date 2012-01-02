class ActionDeductFactorsController < ApplicationController
  # GET /action_deduct_factors
  # GET /action_deduct_factors.xml
  def index
    @action_deduct_factors = ActionDeductFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_deduct_factors }
      format.json  { render :json => @action_deduct_factors }
    end
  end

  # GET /action_deduct_factors/1
  # GET /action_deduct_factors/1.xml
  def show
    @action_deduct_factor = ActionDeductFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_deduct_factor }
      format.json  { render :json => @action_deduct_factor }
    end
  end

  # GET /action_deduct_factors/new
  # GET /action_deduct_factors/new.xml
  def new
    @action_deduct_factor = ActionDeductFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_deduct_factor }
    end
  end

  # GET /action_deduct_factors/1/edit
  def edit
    @action_deduct_factor = ActionDeductFactor.find(params[:id])
  end

  # POST /action_deduct_factors
  # POST /action_deduct_factors.xml
  def create
    @action_deduct_factor = ActionDeductFactor.new(params[:action_deduct_factor])

    respond_to do |format|
      if @action_deduct_factor.save
        format.html { redirect_to(@action_deduct_factor, :notice => 'ActionDeductFactor was successfully created.') }
        format.xml  { render :xml => @action_deduct_factor, :status => :created, :location => @action_deduct_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_deduct_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_deduct_factors/1
  # PUT /action_deduct_factors/1.xml
  def update
    @action_deduct_factor = ActionDeductFactor.find(params[:id])

    respond_to do |format|
      if @action_deduct_factor.update_attributes(params[:action_deduct_factor])
        format.html { redirect_to(@action_deduct_factor, :notice => 'ActionDeductFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_deduct_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_deduct_factors/1
  # DELETE /action_deduct_factors/1.xml
  def destroy
    @action_deduct_factor = ActionDeductFactor.find(params[:id])
    @action_deduct_factor.destroy

    respond_to do |format|
      format.html { redirect_to(action_deduct_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end