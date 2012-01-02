class PrdBalancesController < ApplicationController
  # GET /prd_balances
  # GET /prd_balances.xml
  def index
    @prd_balances = PrdBalance.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_balances }
    end
  end

  # GET /prd_balances/1
  # GET /prd_balances/1.xml
  def show
    @prd_balance = PrdBalance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_balance }
    end
  end

  # GET /prd_balances/new
  # GET /prd_balances/new.xml
  def new
    @prd_balance = PrdBalance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_balance }
    end
  end

  # GET /prd_balances/1/edit
  def edit
    @prd_balance = PrdBalance.find(params[:id])
  end

  # POST /prd_balances
  # POST /prd_balances.xml
  def create
    @prd_balance = PrdBalance.new(params[:prd_balance])

    respond_to do |format|
      if @prd_balance.save
        format.html { redirect_to(@prd_balance, :notice => 'PrdBalance was successfully created.') }
        format.xml  { render :xml => @prd_balance, :status => :created, :location => @prd_balance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_balance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_balances/1
  # PUT /prd_balances/1.xml
  def update
    @prd_balance = PrdBalance.find(params[:id])

    respond_to do |format|
      if @prd_balance.update_attributes(params[:prd_balance])
        format.html { redirect_to(@prd_balance, :notice => 'PrdBalance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_balance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_balances/1
  # DELETE /prd_balances/1.xml
  def destroy
    @prd_balance = PrdBalance.find(params[:id])
    @prd_balance.destroy

    respond_to do |format|
      format.html { redirect_to(prd_balances_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
