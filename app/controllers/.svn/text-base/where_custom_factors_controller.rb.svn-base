class WhereCustomFactorsController < ApplicationController
  # GET /where_custom_factors
  # GET /where_custom_factors.xml
  def index
    @where_custom_factors = WhereCustomFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @where_custom_factors }
    end
  end

  # GET /where_custom_factors/1
  # GET /where_custom_factors/1.xml
  def show
    @where_custom_factor = WhereCustomFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_custom_factor }
    end
  end

  # GET /where_custom_factors/new
  # GET /where_custom_factors/new.xml
  def new
    @where_custom_factor = WhereCustomFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_custom_factor }
    end
  end

  # GET /where_custom_factors/1/edit
  def edit
    @where_custom_factor = WhereCustomFactor.find(params[:id])
  end

  # POST /where_custom_factors
  # POST /where_custom_factors.xml
  def create
    @where_custom_factor = WhereCustomFactor.new(params[:where_custom_factor])

    respond_to do |format|
      if @where_custom_factor.save
        format.html { redirect_to(@where_custom_factor, :notice => 'WhereCustomFactor was successfully created.') }
        format.xml  { render :xml => @where_custom_factor, :status => :created, :location => @where_custom_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_custom_factors/1
  # PUT /where_custom_factors/1.xml
  def update
    @where_custom_factor = WhereCustomFactor.find(params[:id])

    respond_to do |format|
      if @where_custom_factor.update_attributes(params[:where_custom_factor])
        format.html { redirect_to(@where_custom_factor, :notice => 'WhereCustomFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_custom_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_custom_factors/1
  # DELETE /where_custom_factors/1.xml
  def destroy
    @where_custom_factor = WhereCustomFactor.find(params[:id])
    @where_custom_factor.destroy

    respond_to do |format|
      format.html { redirect_to(where_custom_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
