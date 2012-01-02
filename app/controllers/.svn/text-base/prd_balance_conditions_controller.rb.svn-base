class PrdBalanceConditionsController < ApplicationController
  # GET /prd_balance_conditions
  # GET /prd_balance_conditions.xml
  def index
    @prd_balance_conditions = PrdBalanceCondition.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_balance_conditions }
    end
  end

  # GET /prd_balance_conditions/1
  # GET /prd_balance_conditions/1.xml
  def show
    @prd_balance_condition = PrdBalanceCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_balance_condition }
    end
  end

  # GET /prd_balance_conditions/new
  # GET /prd_balance_conditions/new.xml
  def new
    @prd_balance_condition = PrdBalanceCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_balance_condition }
    end
  end

  # GET /prd_balance_conditions/1/edit
  def edit
    @prd_balance_condition = PrdBalanceCondition.find(params[:id])
  end

  # POST /prd_balance_conditions
  # POST /prd_balance_conditions.xml
  def create
    @prd_balance_condition = PrdBalanceCondition.new(params[:prd_balance_condition])

    respond_to do |format|
      if @prd_balance_condition.save
        format.html { redirect_to(@prd_balance_condition, :notice => 'PrdBalanceCondition was successfully created.') }
        format.xml  { render :xml => @prd_balance_condition, :status => :created, :location => @prd_balance_condition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_balance_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_balance_conditions/1
  # PUT /prd_balance_conditions/1.xml
  def update
    @prd_balance_condition = PrdBalanceCondition.find(params[:id])

    respond_to do |format|
      if @prd_balance_condition.update_attributes(params[:prd_balance_condition])
        format.html { redirect_to(@prd_balance_condition, :notice => 'PrdBalanceCondition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_balance_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_balance_conditions/1
  # DELETE /prd_balance_conditions/1.xml
  def destroy
    @prd_balance_condition = PrdBalanceCondition.find(params[:id])
    @prd_balance_condition.destroy

    respond_to do |format|
      format.html { redirect_to(prd_balance_conditions_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
