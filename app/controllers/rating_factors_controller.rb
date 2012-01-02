class RatingFactorsController < ApplicationController
  # GET /rating_factors
  # GET /rating_factors.xml
  def index
    @rating_factors = RatingFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rating_factors }
    end
  end

  # GET /rating_factors/1
  # GET /rating_factors/1.xml
  def show
    @rating_factor = RatingFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rating_factor }
    end
  end

  # GET /rating_factors/new
  # GET /rating_factors/new.xml
  def new
    @rating_factor = RatingFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating_factor }
    end
  end

  # GET /rating_factors/1/edit
  def edit
    @rating_factor = RatingFactor.find(params[:id])
  end

  # POST /rating_factors
  # POST /rating_factors.xml
  def create
    @rating_factor = RatingFactor.new(params[:rating_factor])

    respond_to do |format|
      if @rating_factor.save
        format.html { redirect_to(@rating_factor, :notice => 'RatingFactor was successfully created.') }
        format.xml  { render :xml => @rating_factor, :status => :created, :location => @rating_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rating_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rating_factors/1
  # PUT /rating_factors/1.xml
  def update
    @rating_factor = RatingFactor.find(params[:id])

    respond_to do |format|
      if @rating_factor.update_attributes(params[:rating_factor])
        format.html { redirect_to(@rating_factor, :notice => 'RatingFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rating_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_factors/1
  # DELETE /rating_factors/1.xml
  def destroy
    @rating_factor = RatingFactor.find(params[:id])
    @rating_factor.destroy

    respond_to do |format|
      format.html { redirect_to(rating_factors_url) }
      format.xml  { head :ok }
    end
  end
end
