class WhoPrefixFactorsController < ApplicationController
  # GET /who_prefix_factors
  # GET /who_prefix_factors.xml
  def index
    @who_prefix_factors = WhoPrefixFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_prefix_factors }
    end
  end

  # GET /who_prefix_factors/1
  # GET /who_prefix_factors/1.xml
  def show
    @who_prefix_factor = WhoPrefixFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_prefix_factor }
    end
  end

  # GET /who_prefix_factors/new
  # GET /who_prefix_factors/new.xml
  def new
    @who_prefix_factor = WhoPrefixFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_prefix_factor }
    end
  end

  # GET /who_prefix_factors/1/edit
  def edit
    @who_prefix_factor = WhoPrefixFactor.find(params[:id])
  end

  # POST /who_prefix_factors
  # POST /who_prefix_factors.xml
  def create
    @who_prefix_factor = WhoPrefixFactor.new(params[:who_prefix_factor])

    respond_to do |format|
      if @who_prefix_factor.save
        format.html { redirect_to(@who_prefix_factor, :notice => 'WhoPrefixFactor was successfully created.') }
        format.xml  { render :xml => @who_prefix_factor, :status => :created, :location => @who_prefix_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_prefix_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_prefix_factors/1
  # PUT /who_prefix_factors/1.xml
  def update
    @who_prefix_factor = WhoPrefixFactor.find(params[:id])

    respond_to do |format|
      if @who_prefix_factor.update_attributes(params[:who_prefix_factor])
        format.html { redirect_to(@who_prefix_factor, :notice => 'WhoPrefixFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_prefix_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_prefix_factors/1
  # DELETE /who_prefix_factors/1.xml
  def destroy
    @who_prefix_factor = WhoPrefixFactor.find(params[:id])
    @who_prefix_factor.destroy

    respond_to do |format|
      format.html { redirect_to(who_prefix_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
