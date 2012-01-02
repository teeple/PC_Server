class ActionDeductsController < ApplicationController
  include JsonMapper
  # GET /action_deducts
  # GET /action_deducts.xml
  def index
    @action_deducts = ActionDeduct.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_deducts }
      format.rule  {

		@action_deducts_output  = Hash.new
	  	@action_deducts.each do |action|
			@action_deducts_output[action.subfctr_name] = action.data_to_ruleset
		end 

	  	render :rule => @action_deducts_output 
	  }
    end
  end

  # GET /action_deducts/1
  # GET /action_deducts/1.xml
  def show
    @action_deduct = ActionDeduct.find(params[:id], :include => [:action_deduct_factors])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_deduct }
      format.json	{
	  	render :json => mapping_to_hash(@action_deduct, ActionDeduct.json_mapping_table)
	  }
    end
  end

  # GET /action_deducts/new
  # GET /action_deducts/new.xml
  def new
    @action_deduct = ActionDeduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_deduct }
    end
  end

  # GET /action_deducts/1/edit
  def edit
    @action_deduct = ActionDeduct.find(params[:id])
  end

  # POST /action_deducts
  # POST /action_deducts.xml
  def create
    @action_deduct = ActionDeduct.new(params[:action_deduct])

    respond_to do |format|
      if @action_deduct.save
        format.html { redirect_to(@action_deduct, :notice => 'ActionDeduct was successfully created.') }
        format.xml  { render :xml => @action_deduct, :status => :created, :location => @action_deduct }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_deduct.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_deducts/1
  # PUT /action_deducts/1.xml
  def update
    @action_deduct = ActionDeduct.find(params[:id])

    respond_to do |format|
      if @action_deduct.update_attributes(params[:action_deduct])
        format.html { redirect_to(@action_deduct, :notice => 'ActionDeduct was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_deduct.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_deducts/1
  # DELETE /action_deducts/1.xml
  def destroy
    @action_deduct = ActionDeduct.find(params[:id])
    @action_deduct.destroy

    respond_to do |format|
      format.html { redirect_to(action_deducts_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
