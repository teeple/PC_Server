class WhoCountrySamesController < ApplicationController
  # GET /who_country_sames
  # GET /who_country_sames.xml
  def index
    @who_country_sames = WhoCountrySame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_country_sames }
    end
  end

  # GET /who_country_sames/1
  # GET /who_country_sames/1.xml
  def show
    @who_country_same = WhoCountrySame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_country_same }
    end
  end

  # GET /who_country_sames/new
  # GET /who_country_sames/new.xml
  def new
    @who_country_same = WhoCountrySame.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_country_same }
    end
  end

  # GET /who_country_sames/1/edit
  def edit
    @who_country_same = WhoCountrySame.find(params[:id])
  end

  # POST /who_country_sames
  # POST /who_country_sames.xml
  def create
    @who_country_same = WhoCountrySame.new(params[:who_country_same])

    respond_to do |format|
      if @who_country_same.save
        format.html { redirect_to(@who_country_same, :notice => 'WhoCountrySame was successfully created.') }
        format.xml  { render :xml => @who_country_same, :status => :created, :location => @who_country_same }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_country_same.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_country_sames/1
  # PUT /who_country_sames/1.xml
  def update
    @who_country_same = WhoCountrySame.find(params[:id])

    respond_to do |format|
      if @who_country_same.update_attributes(params[:who_country_same])
        format.html { redirect_to(@who_country_same, :notice => 'WhoCountrySame was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_country_same.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_country_sames/1
  # DELETE /who_country_sames/1.xml
  def destroy
    @who_country_same = WhoCountrySame.find(params[:id])
    @who_country_same.destroy

    respond_to do |format|
      format.html { redirect_to(who_country_sames_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
