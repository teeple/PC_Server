class WhereCountriesController < ApplicationController
  # GET /where_countries
  # GET /where_countries.xml
  def index
    @where_countries = WhereCountry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @where_countries }
    end
  end

  # GET /where_countries/1
  # GET /where_countries/1.xml
  def show
    @where_country = WhereCountry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @where_country }
    end
  end

  # GET /where_countries/new
  # GET /where_countries/new.xml
  def new
    @where_country = WhereCountry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @where_country }
    end
  end

  # GET /where_countries/1/edit
  def edit
    @where_country = WhereCountry.find(params[:id])
  end

  # POST /where_countries
  # POST /where_countries.xml
  def create
    @where_country = WhereCountry.new(params[:where_country])

    respond_to do |format|
      if @where_country.save
        format.html { redirect_to(@where_country, :notice => 'WhereCountry was successfully created.') }
        format.xml  { render :xml => @where_country, :status => :created, :location => @where_country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @where_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /where_countries/1
  # PUT /where_countries/1.xml
  def update
    @where_country = WhereCountry.find(params[:id])

    respond_to do |format|
      if @where_country.update_attributes(params[:where_country])
        format.html { redirect_to(@where_country, :notice => 'WhereCountry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @where_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /where_countries/1
  # DELETE /where_countries/1.xml
  def destroy
    @where_country = WhereCountry.find(params[:id])
    @where_country.destroy

    respond_to do |format|
      format.html { redirect_to(where_countries_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
