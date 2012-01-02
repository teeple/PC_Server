class DbsDepositThresholdsController < ApplicationController
  # GET /dbs_deposit_thresholds
  # GET /dbs_deposit_thresholds.xml
  def index
    @dbs_deposit_thresholds = DbsDepositThreshold.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dbs_deposit_thresholds }
    end
  end

  # GET /dbs_deposit_thresholds/1
  # GET /dbs_deposit_thresholds/1.xml
  def show
    @dbs_deposit_threshold = DbsDepositThreshold.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dbs_deposit_threshold }
    end
  end

  # GET /dbs_deposit_thresholds/new
  # GET /dbs_deposit_thresholds/new.xml
  def new
    @dbs_deposit_threshold = DbsDepositThreshold.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dbs_deposit_threshold }
    end
  end

  # GET /dbs_deposit_thresholds/1/edit
  def edit
    @dbs_deposit_threshold = DbsDepositThreshold.find(params[:id])
  end

  # POST /dbs_deposit_thresholds
  # POST /dbs_deposit_thresholds.xml
  def create
    @dbs_deposit_threshold = DbsDepositThreshold.new(params[:dbs_deposit_threshold])

    respond_to do |format|
      if @dbs_deposit_threshold.save
        format.html { redirect_to(@dbs_deposit_threshold, :notice => 'DbsDepositThreshold was successfully created.') }
        format.xml  { render :xml => @dbs_deposit_threshold, :status => :created, :location => @dbs_deposit_threshold }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dbs_deposit_threshold.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dbs_deposit_thresholds/1
  # PUT /dbs_deposit_thresholds/1.xml
  def update
    @dbs_deposit_threshold = DbsDepositThreshold.find(params[:id])

    respond_to do |format|
      if @dbs_deposit_threshold.update_attributes(params[:dbs_deposit_threshold])
        format.html { redirect_to(@dbs_deposit_threshold, :notice => 'DbsDepositThreshold was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dbs_deposit_threshold.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dbs_deposit_thresholds/1
  # DELETE /dbs_deposit_thresholds/1.xml
  def destroy
    @dbs_deposit_threshold = DbsDepositThreshold.find(params[:id])
    @dbs_deposit_threshold.destroy

    respond_to do |format|
      format.html { redirect_to(dbs_deposit_thresholds_url) }
      format.xml  { head :ok }
    end
  end
end
