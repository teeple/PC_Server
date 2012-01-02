class WhoCountriesController < ApplicationController
  # GET /who_countries
  # GET /who_countries.xml
  def index
    @who_countries = WhoCountry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_countries }
    end
  end

  # GET /who_countries/1
  # GET /who_countries/1.xml
  def show
    @who_country = WhoCountry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_country }
    end
  end

  # GET /who_countries/new
  # GET /who_countries/new.xml
  def new
    @who_country = WhoCountry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_country }
    end
  end

  # GET /who_countries/1/edit
  def edit
    @who_country = WhoCountry.find(params[:id])
  end

  # POST /who_countries
  # POST /who_countries.xml
  def create
    @who_country = WhoCountry.new(params[:who_country])

    respond_to do |format|
      if @who_country.save
        format.html { redirect_to(@who_country, :notice => 'WhoCountry was successfully created.') }
        format.xml  { render :xml => @who_country, :status => :created, :location => @who_country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_countries/1
  # PUT /who_countries/1.xml
  def update
    @who_country = WhoCountry.find(params[:id])

    respond_to do |format|
      if @who_country.update_attributes(params[:who_country])
        format.html { redirect_to(@who_country, :notice => 'WhoCountry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_countries/1
  # DELETE /who_countries/1.xml
  def destroy
    @who_country = WhoCountry.find(params[:id])
    @who_country.destroy

    respond_to do |format|
      format.html { redirect_to(who_countries_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
