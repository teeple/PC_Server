class OcsRatingFactorsController < ApplicationController
  # GET /ocs_rating_factors
  # GET /ocs_rating_factors.xml
  def index
    @ocs_rating_factors = OcsRatingFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ocs_rating_factors }
    end
  end

  # GET /ocs_rating_factors/1
  # GET /ocs_rating_factors/1.xml
  def show
    @ocs_rating_factor = OcsRatingFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ocs_rating_factor }
    end
  end

  # GET /ocs_rating_factors/new
  # GET /ocs_rating_factors/new.xml
  def new
    @ocs_rating_factor = OcsRatingFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ocs_rating_factor }
    end
  end

  # GET /ocs_rating_factors/1/edit
  def edit
    @ocs_rating_factor = OcsRatingFactor.find(params[:id])
  end

  # POST /ocs_rating_factors
  # POST /ocs_rating_factors.xml
  def create
    @ocs_rating_factor = OcsRatingFactor.new(params[:ocs_rating_factor])

    respond_to do |format|
      if @ocs_rating_factor.save
        format.html { redirect_to(@ocs_rating_factor, :notice => 'OcsRatingFactor was successfully created.') }
        format.xml  { render :xml => @ocs_rating_factor, :status => :created, :location => @ocs_rating_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ocs_rating_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ocs_rating_factors/1
  # PUT /ocs_rating_factors/1.xml
  def update
    @ocs_rating_factor = OcsRatingFactor.find(params[:id])

    respond_to do |format|
      if @ocs_rating_factor.update_attributes(params[:ocs_rating_factor])
        format.html { redirect_to(@ocs_rating_factor, :notice => 'OcsRatingFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ocs_rating_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ocs_rating_factors/1
  # DELETE /ocs_rating_factors/1.xml
  def destroy
    @ocs_rating_factor = OcsRatingFactor.find(params[:id])
    @ocs_rating_factor.destroy

    respond_to do |format|
      format.html { redirect_to(ocs_rating_factors_url) }
      format.xml  { head :ok }
    end
  end
end
