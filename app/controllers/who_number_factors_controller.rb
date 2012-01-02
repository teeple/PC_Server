class WhoNumberFactorsController < ApplicationController
  # GET /who_number_factors
  # GET /who_number_factors.xml
  def index
    @who_number_factors = WhoNumberFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_number_factors }
    end
  end

  # GET /who_number_factors/1
  # GET /who_number_factors/1.xml
  def show
    @who_number_factor = WhoNumberFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_number_factor }
    end
  end

  # GET /who_number_factors/new
  # GET /who_number_factors/new.xml
  def new
    @who_number_factor = WhoNumberFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_number_factor }
    end
  end

  # GET /who_number_factors/1/edit
  def edit
    @who_number_factor = WhoNumberFactor.find(params[:id])
  end

  # POST /who_number_factors
  # POST /who_number_factors.xml
  def create
    @who_number_factor = WhoNumberFactor.new(params[:who_number_factor])

    respond_to do |format|
      if @who_number_factor.save
        format.html { redirect_to(@who_number_factor, :notice => 'WhoNumberFactor was successfully created.') }
        format.xml  { render :xml => @who_number_factor, :status => :created, :location => @who_number_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_number_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_number_factors/1
  # PUT /who_number_factors/1.xml
  def update
    @who_number_factor = WhoNumberFactor.find(params[:id])

    respond_to do |format|
      if @who_number_factor.update_attributes(params[:who_number_factor])
        format.html { redirect_to(@who_number_factor, :notice => 'WhoNumberFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_number_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_number_factors/1
  # DELETE /who_number_factors/1.xml
  def destroy
    @who_number_factor = WhoNumberFactor.find(params[:id])
    @who_number_factor.destroy

    respond_to do |format|
      format.html { redirect_to(who_number_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
