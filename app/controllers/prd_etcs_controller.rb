class PrdEtcsController < ApplicationController
  # GET /prd_etcs
  # GET /prd_etcs.xml
  def index
    @prd_etcs = PrdEtc.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_etcs }
    end
  end

  # GET /prd_etcs/1
  # GET /prd_etcs/1.xml
  def show
    @prd_etc = PrdEtc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_etc }
    end
  end

  # GET /prd_etcs/new
  # GET /prd_etcs/new.xml
  def new
    @prd_etc = PrdEtc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_etc }
    end
  end

  # GET /prd_etcs/1/edit
  def edit
    @prd_etc = PrdEtc.find(params[:id])
  end

  # POST /prd_etcs
  # POST /prd_etcs.xml
  def create
    @prd_etc = PrdEtc.new(params[:prd_etc])

    respond_to do |format|
      if @prd_etc.save
        format.html { redirect_to(@prd_etc, :notice => 'PrdEtc was successfully created.') }
        format.xml  { render :xml => @prd_etc, :status => :created, :location => @prd_etc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_etc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_etcs/1
  # PUT /prd_etcs/1.xml
  def update
    @prd_etc = PrdEtc.find(params[:id])

    respond_to do |format|
      if @prd_etc.update_attributes(params[:prd_etc])
        format.html { redirect_to(@prd_etc, :notice => 'PrdEtc was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_etc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_etcs/1
  # DELETE /prd_etcs/1.xml
  def destroy
    @prd_etc = PrdEtc.find(params[:id])
    @prd_etc.destroy

    respond_to do |format|
      format.html { redirect_to(prd_etcs_url) }
      format.xml  { head :ok }
    end
  end
end
