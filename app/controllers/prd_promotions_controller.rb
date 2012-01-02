class PrdPromotionsController < ApplicationController
  # GET /prd_promotions
  # GET /prd_promotions.xml
  def index
    @prd_promotions = PrdPromotion.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_promotions }
    end
  end

  # GET /prd_promotions/1
  # GET /prd_promotions/1.xml
  def show
    @prd_promotion = PrdPromotion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_promotion }
    end
  end

  # GET /prd_promotions/new
  # GET /prd_promotions/new.xml
  def new
    @prd_promotion = PrdPromotion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_promotion }
    end
  end

  # GET /prd_promotions/1/edit
  def edit
    @prd_promotion = PrdPromotion.find(params[:id])
  end

  # POST /prd_promotions
  # POST /prd_promotions.xml
  def create
    @prd_promotion = PrdPromotion.new(params[:prd_promotion])

    respond_to do |format|
      if @prd_promotion.save
        format.html { redirect_to(@prd_promotion, :notice => 'PrdPromotion was successfully created.') }
        format.xml  { render :xml => @prd_promotion, :status => :created, :location => @prd_promotion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_promotions/1
  # PUT /prd_promotions/1.xml
  def update
    @prd_promotion = PrdPromotion.find(params[:id])

    respond_to do |format|
      if @prd_promotion.update_attributes(params[:prd_promotion])
        format.html { redirect_to(@prd_promotion, :notice => 'PrdPromotion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_promotions/1
  # DELETE /prd_promotions/1.xml
  def destroy
    @prd_promotion = PrdPromotion.find(params[:id])
    @prd_promotion.destroy

    respond_to do |format|
      format.html { redirect_to(prd_promotions_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
