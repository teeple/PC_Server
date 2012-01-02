class CodeFactorsController < ApplicationController
  include JsonMapper
  # GET /code_factors
  # GET /code_factors.xml
  def index
    @code_factors = CodeFactor.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @code_factors }
      format.json  { 
	  	@returns = []
	  	@code_factors.each do |code_factor|
	  		@returns << mapping_to_hash(code_factor, CodeFactor.json_mapping_table)
		end 
	  	render :json => @returns
	  }
    end
  end

  # GET /code_factors/1
  # GET /code_factors/1.xml
  def show
    @code_factor = CodeFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @code_factor }
      format.json  { 
	  	render :xml => mapping_to_hash(@code_factor, CodeFactor.json_mapping_table)
	  }
    end
  end

  # GET /code_factors/new
  # GET /code_factors/new.xml
  def new
    @code_factor = CodeFactor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @code_factor }
    end
  end

  # GET /code_factors/1/edit
  def edit
    @code_factor = CodeFactor.find(params[:id])
  end

  # POST /code_factors
  # POST /code_factors.xml
  def create
    @code_factor = CodeFactor.new(params[:code_factor])

    respond_to do |format|
     if @code_factor.save
        format.html { redirect_to(@code_factor, :notice => 'CodeFactor was successfully created.') }
        format.xml  { render :xml => @code_factor, :status => :created, :location => @code_factor }
        format.json  { render :json => @code_factor, :status => :created, :location => @code_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @code_factor.errors, :status => :unprocessable_entity }
        format.json  { render :json => @code_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /code_factors/1
  # PUT /code_factors/1.xml
  def update
    @code_factor = CodeFactor.find(params[:id])

    respond_to do |format|
      if @code_factor.update_attributes(params[:code_factor])
        format.html { redirect_to(@code_factor, :notice => 'CodeFactor was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @code_factor.errors, :status => :unprocessable_entity }
        format.json  { render :json => @code_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /code_factors/1
  # DELETE /code_factors/1.xml
  def destroy

    @code_factor = CodeFactor.find(params[:id])
    @code_factor.destroy

    respond_to do |format|
      format.html { redirect_to(code_factors_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
