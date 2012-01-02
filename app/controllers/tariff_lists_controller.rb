class TariffListsController < ApplicationController
  # GET /tariff_lists
  # GET /tariff_lists.xml
  def index
    @tariff_lists = TariffList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tariff_lists }
      format.json  { render :json => @tariff_lists }
    end
  end

  # GET /tariff_lists/1
  # GET /tariff_lists/1.xml
  def show
    @tariff_list = TariffList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tariff_list }
      format.json  { render :json => @tariff_list }
    end
  end

  # GET /tariff_lists/new
  # GET /tariff_lists/new.xml
  def new
    @tariff_list = TariffList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tariff_list }
    end
  end

  # GET /tariff_lists/1/edit
  def edit
    @tariff_list = TariffList.find(params[:id])
  end

  # POST /tariff_lists
  # POST /tariff_lists.xml
  def create
    @tariff_list = TariffList.new(params[:tariff_list])

    respond_to do |format|
      if @tariff_list.save
        format.html { redirect_to(@tariff_list, :notice => 'TariffList was successfully created.') }
        format.xml  { render :xml => @tariff_list, :status => :created, :location => @tariff_list }
        format.json  { render :json => @tariff_list, :status => :created, :location => @tariff_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tariff_list.errors, :status => :unprocessable_entity }
        format.json  { render :json => @tariff_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tariff_lists/1
  # PUT /tariff_lists/1.xml
  def update
    @tariff_list = TariffList.find(params[:id])

    respond_to do |format|
      if @tariff_list.update_attributes(params[:tariff_list])
        format.html { redirect_to(@tariff_list, :notice => 'TariffList was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tariff_list.errors, :status => :unprocessable_entity }
        format.xml  { render :json => @tariff_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tariff_lists/1
  # DELETE /tariff_lists/1.xml
  def destroy
    @tariff_list = TariffList.find(params[:id])
    @tariff_list.destroy

    respond_to do |format|
      format.html { redirect_to(tariff_lists_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
