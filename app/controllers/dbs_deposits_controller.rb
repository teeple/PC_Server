class DbsDepositsController < ApplicationController
  # GET /dbs_deposits
  # GET /dbs_deposits.xml
  def index
    @dbs_deposits = DbsDeposit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dbs_deposits }
    end
  end

  # GET /dbs_deposits/1
  # GET /dbs_deposits/1.xml
  def show
    @dbs_deposit = DbsDeposit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dbs_deposit }
    end
  end

  # GET /dbs_deposits/new
  # GET /dbs_deposits/new.xml
  def new
    @dbs_deposit = DbsDeposit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dbs_deposit }
    end
  end

  # GET /dbs_deposits/1/edit
  def edit
    @dbs_deposit = DbsDeposit.find(params[:id])
  end

  # POST /dbs_deposits
  # POST /dbs_deposits.xml
  def create
    @dbs_deposit = DbsDeposit.new(params[:dbs_deposit])

    respond_to do |format|
      if @dbs_deposit.save
        format.html { redirect_to(@dbs_deposit, :notice => 'DbsDeposit was successfully created.') }
        format.xml  { render :xml => @dbs_deposit, :status => :created, :location => @dbs_deposit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dbs_deposit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dbs_deposits/1
  # PUT /dbs_deposits/1.xml
  def update
    @dbs_deposit = DbsDeposit.find(params[:id])

    respond_to do |format|
      if @dbs_deposit.update_attributes(params[:dbs_deposit])
        format.html { redirect_to(@dbs_deposit, :notice => 'DbsDeposit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dbs_deposit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dbs_deposits/1
  # DELETE /dbs_deposits/1.xml
  def destroy
    @dbs_deposit = DbsDeposit.find(params[:id])
    @dbs_deposit.destroy

    respond_to do |format|
      format.html { redirect_to(dbs_deposits_url) }
      format.xml  { head :ok }
    end
  end
end
