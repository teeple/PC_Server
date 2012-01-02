class CustomPromotionsController < ApplicationController
  # GET /custom_promotions
  # GET /custom_promotions.xml
  def index
    #@custom_promotions = CustomPromotion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @custom_promotions }
      format.json  { render :json => @custom_promotions }
      format.rule  { 

          @custom_promotions_output = []
          prd_attributes = PrdAttribute.all
          prd_attributes.each do |prd_attribute|

            @custom_promotions << CustomPromotion.data_to_ruleset(prd_attribute)

          end

          render :rule => @custom_promotions 
      }
    end
  end

  # GET /custom_promotions/1
  # GET /custom_promotions/1.xml
  def show
    @custom_promotion = CustomPromotion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @custom_promotion }
      format.json  { render :json => @custom_promotion }
    end
  end

  # GET /custom_promotions/new
  # GET /custom_promotions/new.xml
  def new
    @custom_promotion = CustomPromotion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @custom_promotion }
      format.json  { render :json => @custom_promotion }
    end
  end

  # GET /custom_promotions/1/edit
  def edit
    @custom_promotion = CustomPromotion.find(params[:id])
  end

  # POST /custom_promotions
  # POST /custom_promotions.xml
  def create
    @custom_promotion = CustomPromotion.new(params[:custom_promotion])

    respond_to do |format|
      if @custom_promotion.save
        format.html { redirect_to(@custom_promotion, :notice => 'CustomPromotion was successfully created.') }
        format.xml  { render :xml => @custom_promotion, :status => :created, :location => @custom_promotion }
        format.json  { render :json => @custom_promotion, :status => :created, :location => @custom_promotion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @custom_promotion.errors, :status => :unprocessable_entity }
        format.json  { render :json => @custom_promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /custom_promotions/1
  # PUT /custom_promotions/1.xml
  def update
    @custom_promotion = CustomPromotion.find(params[:id])

    respond_to do |format|
      if @custom_promotion.update_attributes(params[:custom_promotion])
        format.html { redirect_to(@custom_promotion, :notice => 'CustomPromotion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @custom_promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_promotions/1
  # DELETE /custom_promotions/1.xml
  def destroy
    @custom_promotion = CustomPromotion.find(params[:id])
    @custom_promotion.destroy

    respond_to do |format|
      format.html { redirect_to(custom_promotions_url) }
      format.xml  { head :ok }
    end
  end
end
