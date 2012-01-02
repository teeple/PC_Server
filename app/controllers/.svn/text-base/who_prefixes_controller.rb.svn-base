class WhoPrefixesController < ApplicationController
  # GET /who_prefixes
  # GET /who_prefixes.xml
  def index
    @who_prefixes = WhoPrefix.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_prefixes }
    end
  end

  # GET /who_prefixes/1
  # GET /who_prefixes/1.xml
  def show
    @who_prefix = WhoPrefix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_prefix }
    end
  end

  # GET /who_prefixes/new
  # GET /who_prefixes/new.xml
  def new
    @who_prefix = WhoPrefix.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_prefix }
    end
  end

  # GET /who_prefixes/1/edit
  def edit
    @who_prefix = WhoPrefix.find(params[:id])
  end

  # POST /who_prefixes
  # POST /who_prefixes.xml
  def create
    @who_prefix = WhoPrefix.new(params[:who_prefix])

    respond_to do |format|
      if @who_prefix.save
        format.html { redirect_to(@who_prefix, :notice => 'WhoPrefix was successfully created.') }
        format.xml  { render :xml => @who_prefix, :status => :created, :location => @who_prefix }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_prefix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_prefixes/1
  # PUT /who_prefixes/1.xml
  def update
    @who_prefix = WhoPrefix.find(params[:id])

    respond_to do |format|
      if @who_prefix.update_attributes(params[:who_prefix])
        format.html { redirect_to(@who_prefix, :notice => 'WhoPrefix was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_prefix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_prefixes/1
  # DELETE /who_prefixes/1.xml
  def destroy
    @who_prefix = WhoPrefix.find(params[:id])
    @who_prefix.destroy

    respond_to do |format|
      format.html { redirect_to(who_prefixes_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
