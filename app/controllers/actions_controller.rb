class ActionsController < ApplicationController
  include JsonMapper
  # GET /actions
  # GET /actions.xml
  def index
    @actions = Action.all(:order => "id DESC")

	@action_deducts = ActionDeduct.all(:order => "id DESC")
	@action_allows = ActionAllow.all(:order => "id DESC")
	@action_discounts = ActionDiscount.all(:order => "id DESC")
	@action_customs = ActionCustom.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @actions }
      format.json  { 
		@results = Hash.new
		items = []
		@action_deducts.each do |c|
			items << mapping_to_hash(c, ActionDeduct.json_mapping_table_summary)
		end
		@results['Action_Deduct'] = items

		items = []
		@action_allows.each do |c|
			items << mapping_to_hash(c, ActionAllow.json_mapping_table_summary)
		end 
		@results['Action_Allow'] = items

		items = []
		@action_discounts.each do |c|
			items << mapping_to_hash(c, ActionDiscount.json_mapping_table_summary)
		end 
		@results['Action_Discount'] = items

		items = []
		@action_customs.each do |c|
			items << mapping_to_hash(c, ActionCustom.json_mapping_table_summary)
		end 
		@results['Action_Custom'] = items

	  	render :json => @results
		}

      format.rule {
		@action_deducts_output= Hash.new
		@action_deducts.each do |action|
			@action_deducts_output[action.subfctr_name] = action.data_to_ruleset
		end
		output_deduct = render_to_string(:file => TMPL_PATH + RULE['ActionDeduct']['tmpl'])

		@action_allows_output= Hash.new
		@action_allows.each do |action|
			@action_allows_output[action.subfctr_name] = action.data_to_ruleset
		end
		output_allow = render_to_string(:file => TMPL_PATH + RULE['ActionAllow']['tmpl'])

		@action_discounts_output= Hash.new
		@action_discounts.each do |action|
			@action_discounts_output[action.subfctr_name] = action.data_to_ruleset
		end
		output_discount = render_to_string(:file => TMPL_PATH + RULE['ActionDiscount']['tmpl'])

		@action_customs_output= Hash.new
		@action_customs.each do |action|
			@action_customs_output[action.subfctr_name] = action.data_to_ruleset
		end
		output_custom = render_to_string(:file => TMPL_PATH + RULE['ActionCustom']['tmpl'])

		save_to_ruleset( output_deduct, output_allow, output_discount, output_custom)

		@actions_output = []

		@actions_output << output_deduct 
		@actions_output << output_allow 
		@actions_output << output_discount
		@actions_output << output_custom

		render :rule => @actions_output
	  }
    end
  end

  def save_to_ruleset( param1, param2, param3, param4)
		file_name = RULE_PATH + RULE['Action']['rule']

		File.delete(file_name) if File.exist?(file_name)

		file = File.new(file_name, "w")
		file << param1
		file << param2
		file << param3
		file << param4

		file.close
  end 

  # GET /actions/1
  # GET /actions/1.xml
  def show
    @action = Action.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action }
    end
  end

  # GET /actions/new
  # GET /actions/new.xml
  def new
    @action = Action.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action }
    end
  end

  # GET /actions/1/edit
  def edit
    @action = Action.find(params[:id])
  end

  # POST /actions
  # POST /actions.xml
  def create
    @action = Action.new(params[:action])

    respond_to do |format|
      if @action.save
        format.html { redirect_to(@action, :notice => 'Action was successfully created.') }
        format.xml  { render :xml => @action, :status => :created, :location => @action }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /actions/1
  # PUT /actions/1.xml
  def update
    @action = Action.find(params[:id])

    respond_to do |format|
      if @action.update_attributes(params[:action])
        format.html { redirect_to(@action, :notice => 'Action was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /actions/1
  # DELETE /actions/1.xml
  def destroy
    @action = Action.find(params[:id])
    @action.destroy

    respond_to do |format|
      format.html { redirect_to(actions_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end