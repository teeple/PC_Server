class TimeTestsController < ApplicationController
  # GET /time_tests
  # GET /time_tests.xml
  def index
    @time_tests = TimeTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_tests }
    end
  end

  # GET /time_tests/1
  # GET /time_tests/1.xml
  def show
    @time_test = TimeTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_test }
    end
  end

  # GET /time_tests/new
  # GET /time_tests/new.xml
  def new
    @time_test = TimeTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_test }
    end
  end

  # GET /time_tests/1/edit
  def edit
    @time_test = TimeTest.find(params[:id])
  end

  # POST /time_tests
  # POST /time_tests.xml
  def create
    @time_test = TimeTest.new(params[:time_test])

	@time_test.time_test = Time.zone.now

    respond_to do |format|
      if @time_test.save
        format.html { redirect_to(@time_test, :notice => 'TimeTest was successfully created.') }
        format.xml  { render :xml => @time_test, :status => :created, :location => @time_test }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /time_tests/1
  # PUT /time_tests/1.xml
  def update
    @time_test = TimeTest.find(params[:id])

    respond_to do |format|
      if @time_test.update_attributes(params[:time_test])
        format.html { redirect_to(@time_test, :notice => 'TimeTest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /time_tests/1
  # DELETE /time_tests/1.xml
  def destroy
    @time_test = TimeTest.find(params[:id])
    @time_test.destroy

    respond_to do |format|
      format.html { redirect_to(time_tests_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
