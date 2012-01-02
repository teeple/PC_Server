class BalancesController < ApplicationController
  include JsonMapper
  # GET /balances
  # GET /balances.xml
  def index
    @balances = Balance.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @balances }
      format.json  { 

		@results = []
	  	@balances.each do |balance|
			@results << mapping_to_hash(balance, Balance.json_mapping_table)
		end 

	  	render :json => @results
	  }

	  format.rule  {

		@balance_list_output = []
		@balance_counters_output = []

	  	@balances.each do |balance|
			@balance_list_output << balance.name if not balance.name.blank?
			@balance_counters_output << balance.data_to_ruleset_counter if not balance.blank? 
		end

		output_list = render_to_string(:file => TMPL_PATH + RULE['Balance']['tmpl_list'])
		save_to_ruleset_list(output_list)

		output_counter = render_to_string(:file => TMPL_PATH + RULE['Balance']['tmpl_counter'])
		save_to_ruleset_counter(output_counter)

	  	render :rule => [output_list, output_counter]
	  }
    end
  end

  def save_to_ruleset_list(balance_list)
    file_name = RULE_PATH + RULE['Balance']['value_list']
	File.delete(file_name) if File.exist?(file_name)

	file = File.new(file_name, "w")

	file << balance_list 
	file.close
  end 

  def save_to_ruleset_counter(counter_list)
    file_name = RULE_PATH + RULE['Balance']['rule_counter']
	File.delete(file_name) if File.exist?(file_name)

	file = File.new(file_name, "w")

	file << counter_list
	file.close
  end 

  # GET /balances/1
  # GET /balances/1.xml
  def show
    @balance = Balance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @balance }
      format.json  { 
	  	render :json => mapping_to_hash(@balance, Balance.json_mapping_table)
	}
    end
  end

  # GET /balances/new
  # GET /balances/new.xml
  def new
    @balance = Balance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @balance }
    end
  end

  # GET /balances/1/edit
  def edit
    @balance = Balance.find(params[:id])
  end

  # POST /balances
  # POST /balances.xml
  def create
    @balance = Balance.new(params[:balance])

		if @balance.name == 'FREE_PACKET'
			@balance.balance_type = 'BYTE'
		end

    respond_to do |format|
      if @balance.save
        format.html { redirect_to(@balance, :notice => 'Balance was successfully created.') }
        format.xml  { render :xml => @balance, :status => :created, :location => @balance }
        format.json  { 
			render :json => @balance, :status => :created, :location => @balance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @balance.errors, :status => :unprocessable_entity }
        format.json  { render :json => @balance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /balances/1
  # PUT /balances/1.xml
  def update
    @balance = Balance.find(params[:id])

		if @balance.name == 'FREE_PACKET'
			params[:balance]['balance_type'] = 'BYTE'
		end

    respond_to do |format|
      if @balance.update_attributes(params[:balance])
        format.html { redirect_to(@balance, :notice => 'Balance was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @balance.errors, :status => :unprocessable_entity }
        format.json  { render :json => @balance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /balances/1
  # DELETE /balances/1.xml
  def destroy
    @balance = Balance.find(params[:id])
    @balance.destroy

    respond_to do |format|
      format.html { redirect_to(balances_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
