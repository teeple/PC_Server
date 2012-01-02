class ActionDiscountsController < ApplicationController
  include JsonMapper
  # GET /action_discounts
  # GET /action_discounts.xml
  def index
    @action_discounts = ActionDiscount.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_discounts }
      format.rule  { 

		@action_discounts_output = Hash.new
		@action_discounts.each do |action|
			@action_discounts_output["rule_" + action.id.to_s] = action.data_to_ruleset
		end
	  	render :rule => @action_discounts_output
	  }
    end
  end

  # GET /action_discounts/1
  # GET /action_discounts/1.xml
  def show
    @action_discount = ActionDiscount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_discount }
      format.json  { 
	  	render :json => mapping_to_hash(@action_discount, ActionDiscount.json_mapping_table)
	  }
    end
  end

  # GET /action_discounts/new
  # GET /action_discounts/new.xml
  def new
    @action_discount = ActionDiscount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_discount }
    end
  end

  # GET /action_discounts/1/edit
  def edit
    @action_discount = ActionDiscount.find(params[:id])
  end

  # POST /action_discounts
  # POST /action_discounts.xml
  def create
    @action_discount = ActionDiscount.new(params[:action_discount])

    respond_to do |format|
      if @action_discount.save
        format.html { redirect_to(@action_discount, :notice => 'ActionDiscount was successfully created.') }
        format.xml  { render :xml => @action_discount, :status => :created, :location => @action_discount }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_discount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_discounts/1
  # PUT /action_discounts/1.xml
  def update
    @action_discount = ActionDiscount.find(params[:id])

    respond_to do |format|
      if @action_discount.update_attributes(params[:action_discount])
        format.html { redirect_to(@action_discount, :notice => 'ActionDiscount was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_discount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_discounts/1
  # DELETE /action_discounts/1.xml
  def destroy
    @action_discount = ActionDiscount.find(params[:id])
    @action_discount.destroy

    respond_to do |format|
      format.html { redirect_to(action_discounts_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
