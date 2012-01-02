class TestTestsController < ApplicationController
  # GET /test_tests
  # GET /test_tests.xml
  def index
    @test_tests = TestTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @test_tests }
      format.json  { render :json => @test_tests }
    end
  end

  # GET /test_tests/1
  # GET /test_tests/1.xml
  def show
    @test_test = TestTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test_test }
    end
  end

  # GET /test_tests/new
  # GET /test_tests/new.xml
  def new
    @test_test = TestTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test_test }
    end
  end

  # GET /test_tests/1/edit
  def edit
    @test_test = TestTest.find(params[:id])
  end

  # POST /test_tests
  # POST /test_tests.xml
  def create
    @test_test = TestTest.new(params[:test_test])

    respond_to do |format|
      if @test_test.save
        format.html { redirect_to(@test_test, :notice => 'TestTest was successfully created.') }
        format.xml  { render :xml => @test_test, :status => :created, :location => @test_test }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_tests/1
  # PUT /test_tests/1.xml
  def update
    @test_test = TestTest.find(params[:id])

    respond_to do |format|
      if @test_test.update_attributes(params[:test_test])
        format.html { redirect_to(@test_test, :notice => 'TestTest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_tests/1
  # DELETE /test_tests/1.xml
  def destroy
    @test_test = TestTest.find(params[:id])
    @test_test.destroy

    respond_to do |format|
      format.html { redirect_to(test_tests_url) }
      format.xml  { head :ok }
    end
  end
end
