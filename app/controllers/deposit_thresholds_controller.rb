class DepositThresholdsController < ApplicationController
  # GET /deposit_thresholds
  # GET /deposit_thresholds.xml
  def index
    @deposit_thresholds = DepositThreshold.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deposit_thresholds }
    end
  end

  # GET /deposit_thresholds/1
  # GET /deposit_thresholds/1.xml
  def show
    @deposit_threshold = DepositThreshold.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deposit_threshold }
    end
  end

  # GET /deposit_thresholds/new
  # GET /deposit_thresholds/new.xml
  def new
    @deposit_threshold = DepositThreshold.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deposit_threshold }
    end
  end

  # GET /deposit_thresholds/1/edit
  def edit
    @deposit_threshold = DepositThreshold.find(params[:id])
  end

  # POST /deposit_thresholds
  # POST /deposit_thresholds.xml
  def create
    @deposit_threshold = DepositThreshold.new(params[:deposit_threshold])

    respond_to do |format|
      if @deposit_threshold.save
        format.html { redirect_to(@deposit_threshold, :notice => 'DepositThreshold was successfully created.') }
        format.xml  { render :xml => @deposit_threshold, :status => :created, :location => @deposit_threshold }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deposit_threshold.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deposit_thresholds/1
  # PUT /deposit_thresholds/1.xml
  def update
    @deposit_threshold = DepositThreshold.find(params[:id])

    respond_to do |format|
      if @deposit_threshold.update_attributes(params[:deposit_threshold])
        format.html { redirect_to(@deposit_threshold, :notice => 'DepositThreshold was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deposit_threshold.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deposit_thresholds/1
  # DELETE /deposit_thresholds/1.xml
  def destroy
    @deposit_threshold = DepositThreshold.find(params[:id])
    @deposit_threshold.destroy

    respond_to do |format|
      format.html { redirect_to(deposit_thresholds_url) }
      format.xml  { head :ok }
    end
  end
end
