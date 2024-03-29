class DepositsController < ApplicationController
  # GET /deposits
  # GET /deposits.xml
  def index
    @deposits = Deposit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deposits }
      format.json  { render :json => @deposits }
    end
  end

  # GET /deposits/1
  # GET /deposits/1.xml
  def show
    @deposit = Deposit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deposit }
      format.json  { render :json => @deposit }
    end
  end

  # GET /deposits/new
  # GET /deposits/new.xml
  def new
    @deposit = Deposit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deposit }
    end
  end

  # GET /deposits/1/edit
  def edit
    @deposit = Deposit.find(params[:id])
  end

  # POST /deposits
  # POST /deposits.xml
  def create
    @deposit = Deposit.new(params[:deposit])

    respond_to do |format|
      if @deposit.save
        format.html { redirect_to(@deposit, :notice => 'Deposit was successfully created.') }
        format.xml  { render :xml => @deposit, :status => :created, :location => @deposit }
        format.json  { render :json => @deposit, :status => :created, :location => @deposit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deposit.errors, :status => :unprocessable_entity }
        format.json  { render :json => @deposit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deposits/1
  # PUT /deposits/1.xml
  def update
    @deposit = Deposit.find(params[:id])

    respond_to do |format|
      if @deposit.update_attributes(params[:deposit])
        format.html { redirect_to(@deposit, :notice => 'Deposit was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deposit.errors, :status => :unprocessable_entity }
        format.json  { render :json => @deposit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deposits/1
  # DELETE /deposits/1.xml
  def destroy
    @deposit = Deposit.find(params[:id])
    @deposit.destroy

    respond_to do |format|
      format.html { redirect_to(deposits_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
