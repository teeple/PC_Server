class WhoCustomFactorsController < ApplicationController
  # GET /who_custom_factors
  # GET /who_custom_factors.xml
  def index
    @who_custom_factors = WhoCustomFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_custom_factors }
    end
  end

  # GET /who_custom_factors/1
  # GET /who_custom_factors/1.xml
  def show
    @who_custom_factor = WhoCustomFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_custom_factor }
    end
  end

  # GET /who_custom_factors/new
  # GET /who_custom_factors/new.xml
  def new
    @who_custom_factor = WhoCustomFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_custom_factor }
    end
  end

  # GET /who_custom_factors/1/edit
  def edit
    @who_custom_factor = WhoCustomFactor.find(params[:id])
  end

  # POST /who_custom_factors
  # POST /who_custom_factors.xml
  def create
    @who_custom_factor = WhoCustomFactor.new(params[:who_custom_factor])

    respond_to do |format|
      if @who_custom_factor.save
        format.html { redirect_to(@who_custom_factor, :notice => 'WhoCustomFactor was successfully created.') }
        format.xml  { render :xml => @who_custom_factor, :status => :created, :location => @who_custom_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_custom_factors/1
  # PUT /who_custom_factors/1.xml
  def update
    @who_custom_factor = WhoCustomFactor.find(params[:id])

    respond_to do |format|
      if @who_custom_factor.update_attributes(params[:who_custom_factor])
        format.html { redirect_to(@who_custom_factor, :notice => 'WhoCustomFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_custom_factors/1
  # DELETE /who_custom_factors/1.xml
  def destroy
    @who_custom_factor = WhoCustomFactor.find(params[:id])
    @who_custom_factor.destroy

    respond_to do |format|
      format.html { redirect_to(who_custom_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
