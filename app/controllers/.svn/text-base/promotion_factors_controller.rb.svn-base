class PromotionFactorsController < ApplicationController
  # GET /promotion_factors
  # GET /promotion_factors.xml
  def index
    @promotion_factors = PromotionFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @promotion_factors }
      format.json  { render :json => @promotion_factors }
    end
  end

  # GET /promotion_factors/1
  # GET /promotion_factors/1.xml
  def show
    @promotion_factor = PromotionFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @promotion_factor }
      format.json  { render :json => @promotion_factor }
    end
  end

  # GET /promotion_factors/new
  # GET /promotion_factors/new.xml
  def new
    @promotion_factor = PromotionFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @promotion_factor }
    end
  end

  # GET /promotion_factors/1/edit
  def edit
    @promotion_factor = PromotionFactor.find(params[:id])
  end

  # POST /promotion_factors
  # POST /promotion_factors.xml
  def create
    @promotion_factor = PromotionFactor.new(params[:promotion_factor])

    respond_to do |format|
      if @promotion_factor.save
        format.html { redirect_to(@promotion_factor, :notice => 'PromotionFactor was successfully created.') }
        format.xml  { render :xml => @promotion_factor, :status => :created, :location => @promotion_factor }
        format.json  { render :json => @promotion_factor, :status => :created, :location => @promotion_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @promotion_factor.errors, :status => :unprocessable_entity }
        format.json  { render :json => @promotion_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /promotion_factors/1
  # PUT /promotion_factors/1.xml
  def update
    @promotion_factor = PromotionFactor.find(params[:id])

    respond_to do |format|
      if @promotion_factor.update_attributes(params[:promotion_factor])
        format.html { redirect_to(@promotion_factor, :notice => 'PromotionFactor was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @promotion_factor.errors, :status => :unprocessable_entity }
        format.json  { render :json => @promotion_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /promotion_factors/1
  # DELETE /promotion_factors/1.xml
  def destroy
    @promotion_factor = PromotionFactor.find(params[:id])
    @promotion_factor.destroy

    respond_to do |format|
      format.html { redirect_to(promotion_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
