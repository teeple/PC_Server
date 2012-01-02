class PrdPromotionFactorsController < ApplicationController
  # GET /prd_promotion_factors
  # GET /prd_promotion_factors.xml
  def index
    @prd_promotion_factors = PrdPromotionFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_promotion_factors }
    end
  end

  # GET /prd_promotion_factors/1
  # GET /prd_promotion_factors/1.xml
  def show
    @prd_promotion_factor = PrdPromotionFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_promotion_factor }
    end
  end

  # GET /prd_promotion_factors/new
  # GET /prd_promotion_factors/new.xml
  def new
    @prd_promotion_factor = PrdPromotionFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_promotion_factor }
    end
  end

  # GET /prd_promotion_factors/1/edit
  def edit
    @prd_promotion_factor = PrdPromotionFactor.find(params[:id])
  end

  # POST /prd_promotion_factors
  # POST /prd_promotion_factors.xml
  def create
    @prd_promotion_factor = PrdPromotionFactor.new(params[:prd_promotion_factor])

    respond_to do |format|
      if @prd_promotion_factor.save
        format.html { redirect_to(@prd_promotion_factor, :notice => 'PrdPromotionFactor was successfully created.') }
        format.xml  { render :xml => @prd_promotion_factor, :status => :created, :location => @prd_promotion_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_promotion_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_promotion_factors/1
  # PUT /prd_promotion_factors/1.xml
  def update
    @prd_promotion_factor = PrdPromotionFactor.find(params[:id])

    respond_to do |format|
      if @prd_promotion_factor.update_attributes(params[:prd_promotion_factor])
        format.html { redirect_to(@prd_promotion_factor, :notice => 'PrdPromotionFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_promotion_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_promotion_factors/1
  # DELETE /prd_promotion_factors/1.xml
  def destroy
    @prd_promotion_factor = PrdPromotionFactor.find(params[:id])
    @prd_promotion_factor.destroy

    respond_to do |format|
      format.html { redirect_to(prd_promotion_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
