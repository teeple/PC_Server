class CsProductConditionsController < ApplicationController
  # GET /cs_product_conditions
  # GET /cs_product_conditions.xml
  def index
    @cs_product_conditions = CsProductCondition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cs_product_conditions }
    end
  end

  # GET /cs_product_conditions/1
  # GET /cs_product_conditions/1.xml
  def show
    @cs_product_condition = CsProductCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cs_product_condition }
    end
  end

  # GET /cs_product_conditions/new
  # GET /cs_product_conditions/new.xml
  def new
    @cs_product_condition = CsProductCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cs_product_condition }
    end
  end

  # GET /cs_product_conditions/1/edit
  def edit
    @cs_product_condition = CsProductCondition.find(params[:id])
  end

  # POST /cs_product_conditions
  # POST /cs_product_conditions.xml
  def create
    @cs_product_condition = CsProductCondition.new(params[:cs_product_condition])

    respond_to do |format|
      if @cs_product_condition.save
        format.html { redirect_to(@cs_product_condition, :notice => 'CsProductCondition was successfully created.') }
        format.xml  { render :xml => @cs_product_condition, :status => :created, :location => @cs_product_condition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cs_product_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cs_product_conditions/1
  # PUT /cs_product_conditions/1.xml
  def update
    @cs_product_condition = CsProductCondition.find(params[:id])

    respond_to do |format|
      if @cs_product_condition.update_attributes(params[:cs_product_condition])
        format.html { redirect_to(@cs_product_condition, :notice => 'CsProductCondition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cs_product_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cs_product_conditions/1
  # DELETE /cs_product_conditions/1.xml
  def destroy
    @cs_product_condition = CsProductCondition.find(params[:id])
    @cs_product_condition.destroy

    respond_to do |format|
      format.html { redirect_to(cs_product_conditions_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
