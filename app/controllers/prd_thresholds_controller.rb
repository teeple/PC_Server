class PrdThresholdsController < ApplicationController
  # GET /prd_thresholds
  # GET /prd_thresholds.xml
  def index
    @prd_thresholds = PrdThreshold.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_thresholds }
    end
  end

  # GET /prd_thresholds/1
  # GET /prd_thresholds/1.xml
  def show
    @prd_threshold = PrdThreshold.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_threshold }
    end
  end

  # GET /prd_thresholds/new
  # GET /prd_thresholds/new.xml
  def new
    @prd_threshold = PrdThreshold.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_threshold }
    end
  end

  # GET /prd_thresholds/1/edit
  def edit
    @prd_threshold = PrdThreshold.find(params[:id])
  end

  # POST /prd_thresholds
  # POST /prd_thresholds.xml
  def create
    @prd_threshold = PrdThreshold.new(params[:prd_threshold])

    respond_to do |format|
      if @prd_threshold.save
        format.html { redirect_to(@prd_threshold, :notice => 'PrdThreshold was successfully created.') }
        format.xml  { render :xml => @prd_threshold, :status => :created, :location => @prd_threshold }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_threshold.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_thresholds/1
  # PUT /prd_thresholds/1.xml
  def update
    @prd_threshold = PrdThreshold.find(params[:id])

    respond_to do |format|
      if @prd_threshold.update_attributes(params[:prd_threshold])
        format.html { redirect_to(@prd_threshold, :notice => 'PrdThreshold was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_threshold.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_thresholds/1
  # DELETE /prd_thresholds/1.xml
  def destroy
    @prd_threshold = PrdThreshold.find(params[:id])
    @prd_threshold.destroy

    respond_to do |format|
      format.html { redirect_to(prd_thresholds_url) }
      format.xml  { head :ok }
    end
  end
end
