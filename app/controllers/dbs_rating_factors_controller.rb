class DbsRatingFactorsController < ApplicationController
  # GET /dbs_rating_factors
  # GET /dbs_rating_factors.xml
  def index
    @dbs_rating_factors = DbsRatingFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dbs_rating_factors }
    end
  end

  # GET /dbs_rating_factors/1
  # GET /dbs_rating_factors/1.xml
  def show
    @dbs_rating_factor = DbsRatingFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dbs_rating_factor }
    end
  end

  # GET /dbs_rating_factors/new
  # GET /dbs_rating_factors/new.xml
  def new
    @dbs_rating_factor = DbsRatingFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dbs_rating_factor }
    end
  end

  # GET /dbs_rating_factors/1/edit
  def edit
    @dbs_rating_factor = DbsRatingFactor.find(params[:id])
  end

  # POST /dbs_rating_factors
  # POST /dbs_rating_factors.xml
  def create
    @dbs_rating_factor = DbsRatingFactor.new(params[:dbs_rating_factor])

    respond_to do |format|
      if @dbs_rating_factor.save
        format.html { redirect_to(@dbs_rating_factor, :notice => 'DbsRatingFactor was successfully created.') }
        format.xml  { render :xml => @dbs_rating_factor, :status => :created, :location => @dbs_rating_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dbs_rating_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dbs_rating_factors/1
  # PUT /dbs_rating_factors/1.xml
  def update
    @dbs_rating_factor = DbsRatingFactor.find(params[:id])

    respond_to do |format|
      if @dbs_rating_factor.update_attributes(params[:dbs_rating_factor])
        format.html { redirect_to(@dbs_rating_factor, :notice => 'DbsRatingFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dbs_rating_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dbs_rating_factors/1
  # DELETE /dbs_rating_factors/1.xml
  def destroy
    @dbs_rating_factor = DbsRatingFactor.find(params[:id])
    @dbs_rating_factor.destroy

    respond_to do |format|
      format.html { redirect_to(dbs_rating_factors_url) }
      format.xml  { head :ok }
    end
  end
end
