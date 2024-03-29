class PrdSubscriptionsController < ApplicationController
  # GET /prd_subscriptions
  # GET /prd_subscriptions.xml
  def index
    @prd_subscriptions = PrdSubscription.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_subscriptions }
      format.json  { render :json => @prd_subscriptions }
    end
  end

  # GET /prd_subscriptions/1
  # GET /prd_subscriptions/1.xml
  def show
    @prd_subscription = PrdSubscription.find(params[:id])

	#who = WhoFactor.new(:fctr_code => "who123", :member_name => "facmily")
	#when = WhenFactor.new(:fctr_code => "when233", :duration_name => "20days")
	#where = WhereFactor.new(:fctr_code => "where123", :country_name => "Asia")

	#temp1 = PrdSubscription.create()
	#temp1.condition = who
	#temp1.save!

	#temp2= PrdSubscription.create()
	#temp2.condition = when
	#temp2.save!

	#temp3= PrdSubscription.create()
	#temp3.condition = where
	#temp3.save!

	#temp4 = WhereFactor.find_by_id(2)

  	#root = PrdSubscription.create()
	#root.condition = temp4

	#child1  = root.children.create(:condition_type => "Condition_What")
	#child1_1 = child1.children.create(:condition_type => "Condition_When")
	#child1_2 = child1.children.create(:condition_type => "Condition_Where")

	#child2  = root.children.create(:condition_type => "Condition_Where")
	#child2_1 = child2.children.create(:condition_type => "Condition_Who")

	#puts sub_category.children.size
	#display_children(sub_category)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_subscription }
    end
  end

  # GET /prd_subscriptions/new
  # GET /prd_subscriptions/new.xml
  def new
    @prd_subscription = PrdSubscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_subscription }
    end
  end

  # GET /prd_subscriptions/1/edit
  def edit
    @prd_subscription = PrdSubscription.find(params[:id])
  end

  # POST /prd_subscriptions
  # POST /prd_subscriptions.xml
  def create
    @prd_subscription = PrdSubscription.new(params[:prd_subscription])

    respond_to do |format|
      if @prd_subscription.save
        format.html { redirect_to(@prd_subscription, :notice => 'PrdSubscription was successfully created.') }
        format.xml  { render :xml => @prd_subscription, :status => :created, :location => @prd_subscription }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_subscriptions/1
  # PUT /prd_subscriptions/1.xml
  def update
    @prd_subscription = PrdSubscription.find(params[:id])

    respond_to do |format|
      if @prd_subscription.update_attributes(params[:prd_subscription])
        format.html { redirect_to(@prd_subscription, :notice => 'PrdSubscription was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_subscriptions/1
  # DELETE /prd_subscriptions/1.xml
  def destroy
    @prd_subscription = PrdSubscription.find(params[:id])
    @prd_subscription.destroy

    respond_to do |format|
      format.html { redirect_to(prd_subscriptions_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end

end
