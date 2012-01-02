class TariffFileListsController < ApplicationController
  require 'csv'

  # GET /tariff_file_lists
  # GET /tariff_file_lists.xml
  def index
    @tariff_file_lists = TariffFileList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tariff_file_lists }
      format.json  { 
        render :json => @tariff_file_lists 
      }
    end
  end

  # GET /tariff_file_lists/1
  # GET /tariff_file_lists/1.xml
  def show
    @tariff_file_list = TariffFileList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tariff_file_list }
      format.json  { 

          output =  mapping_to_hash(@tariff_file_list, TariffFileList.json_mapping_table)
          output_to_hash = Hash['tariff_file_list' => output]
          render :json => output_to_hash
          #render :json => ret
      }
    end
  end

  # GET /tariff_file_lists/new
  # GET /tariff_file_lists/new.xml
  def new
    @tariff_file_list = TariffFileList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tariff_file_list }
      format.json { 
          render :json => @tariff_file_list 
      }
    end
  end

  # GET /tariff_file_lists/1/edit
  def edit
    @tariff_file_list = TariffFileList.find(params[:id])
  end

  # POST /tariff_file_lists
  # POST /tariff_file_lists.xml
  def create
    debugger

    #@tariff_file_list = TariffFileList.new(params[:tariff_file_list])
    #@tariff_file_list.save!

    @tariff_file_list = TariffFileList.new

    @tariff_file_list.header = params[:tariff_file_list][:header]
    @tariff_file_list.body = params[:tariff_file_list][:body]

    respond_to do |format|

      if @tariff_file_list.save
        format.html { redirect_to(@tariff_file_list, :notice => 'TariffFileList was successfully created.') }
        format.xml  { render :xml => @tariff_file_list, :status => :created, :location => @tariff_file_list }
        format.json  {
            @tariff_file_list.save!
            output = mapping_to_hash(@tariff_file_list, TariffFileList.json_mapping_table)
            output_to_hash = Hash["tariff_file_list" => output]
            render :json => output_to_hash, :status => :created, :location => @tariff_file_list 
            # render :json => @tariff_file_list, :status => :created, :location => @tariff_file_list 
      }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tariff_file_list.errors, :status => :unprocessable_entity }
        format.json  { render :json => @tariff_file_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tariff_file_lists/1
  # PUT /tariff_file_lists/1.xml
  def update
    @tariff_file_list = TariffFileList.find(params[:id])

    @tariff_file_list.header = params[:tariff_file_list][:header]
    @tariff_file_list.body = params[:tariff_file_list][:body]

    respond_to do |format|
      #if @tariff_file_list.update_attributes(params[:tariff_file_list])
      if @tariff_file_list.save
        format.html { redirect_to(@tariff_file_list, :notice => 'TariffFileList was successfully updated.') }
        format.xml  { head :ok }
        format.json  { 
            head :ok 
        }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @tariff_file_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tariff_file_lists/1
  # DELETE /tariff_file_lists/1.xml
  def destroy
    @tariff_file_list = TariffFileList.find(params[:id])
    @tariff_file_list.destroy

    respond_to do |format|
      format.html { redirect_to(tariff_file_lists_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end

