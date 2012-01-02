class ActionAllowsController < ApplicationController
  include JsonMapper

  # GET /action_allows
  # GET /action_allows.xml
  def index
    @action_allows = ActionAllow.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_allows }
      format.rule  {

	  	@action_allows_output = Hash.new
		@action_allows.each do |action|
			@action_allows_output['rule_' + action.id.to_s] = action.data_to_ruleset
		end 

	  	render :rule => @action_allows_output
	  }
    end
  end

  # GET /action_allows/1
  # GET /action_allows/1.xml
  def show
    @action_allow = ActionAllow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_allow }
      format.json  { 
	  	render :json => mapping_to_hash(@action_allow, ActionAllow.json_mapping_table)
	  }
    end
  end

  # GET /action_allows/new
  # GET /action_allows/new.xml
  def new
    @action_allow = ActionAllow.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_allow }
    end
  end

  # GET /action_allows/1/edit
  def edit
    @action_allow = ActionAllow.find(params[:id])
  end

  # POST /action_allows
  # POST /action_allows.xml
  def create
    @action_allow = ActionAllow.new(params[:action_allow])

    respond_to do |format|
      if @action_allow.save
        format.html { redirect_to(@action_allow, :notice => 'ActionAllow was successfully created.') }
        format.xml  { render :xml => @action_allow, :status => :created, :location => @action_allow }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_allow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_allows/1
  # PUT /action_allows/1.xml
  def update
    @action_allow = ActionAllow.find(params[:id])

    respond_to do |format|
      if @action_allow.update_attributes(params[:action_allow])
        format.html { redirect_to(@action_allow, :notice => 'ActionAllow was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_allow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_allows/1
  # DELETE /action_allows/1.xml
  def destroy
    @action_allow = ActionAllow.find(params[:id])
    @action_allow.destroy

    respond_to do |format|
      format.html { redirect_to(action_allows_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
