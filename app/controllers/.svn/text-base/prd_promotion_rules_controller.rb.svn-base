class PrdPromotionRulesController < ApplicationController
  # GET /prd_promotion_rules
  # GET /prd_promotion_rules.xml
  def index
    @prd_promotion_rules = PrdPromotionRule.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_promotion_rules }
    end
  end

  # GET /prd_promotion_rules/1
  # GET /prd_promotion_rules/1.xml
  def show
    @prd_promotion_rule = PrdPromotionRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_promotion_rule }
    end
  end

  # GET /prd_promotion_rules/new
  # GET /prd_promotion_rules/new.xml
  def new
    @prd_promotion_rule = PrdPromotionRule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_promotion_rule }
    end
  end

  # GET /prd_promotion_rules/1/edit
  def edit
    @prd_promotion_rule = PrdPromotionRule.find(params[:id])
  end

  # POST /prd_promotion_rules
  # POST /prd_promotion_rules.xml
  def create
    @prd_promotion_rule = PrdPromotionRule.new(params[:prd_promotion_rule])

    respond_to do |format|
      if @prd_promotion_rule.save
        format.html { redirect_to(@prd_promotion_rule, :notice => 'PrdPromotionRule was successfully created.') }
        format.xml  { render :xml => @prd_promotion_rule, :status => :created, :location => @prd_promotion_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_promotion_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_promotion_rules/1
  # PUT /prd_promotion_rules/1.xml
  def update
    @prd_promotion_rule = PrdPromotionRule.find(params[:id])

    respond_to do |format|
      if @prd_promotion_rule.update_attributes(params[:prd_promotion_rule])
        format.html { redirect_to(@prd_promotion_rule, :notice => 'PrdPromotionRule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_promotion_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_promotion_rules/1
  # DELETE /prd_promotion_rules/1.xml
  def destroy
    @prd_promotion_rule = PrdPromotionRule.find(params[:id])
    @prd_promotion_rule.destroy

    respond_to do |format|
      format.html { redirect_to(prd_promotion_rules_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
