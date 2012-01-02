class WhoNumbersController < ApplicationController
  # GET /who_numbers
  # GET /who_numbers.xml
  def index
    @who_numbers = WhoNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_numbers }
      format.json  { 
	     	@results = Hash.new
			temp_array = []

			if @who_numbers.size > 0 
				@results['name'] = @who_numbers[0].subfctr_name
				@results['description'] = @who_numbers[0].description
				@who_numbers.each do |item|
					temp_array << item.data_to_frontend
				end
				@results['numbers'] = temp_array 
			end

	  		render :json => @results 
		}
    end
  end

  # GET /who_numbers/1
  # GET /who_numbers/1.xml
  def show
    @who_number = WhoNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_number }
    end
  end

  # GET /who_numbers/new
  # GET /who_numbers/new.xml
  def new
    @who_number = WhoNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_number }
    end
  end

  # GET /who_numbers/1/edit
  def edit
    @who_number = WhoNumber.find(params[:id])
  end

  # POST /who_numbers
  # POST /who_numbers.xml
  def create
    @who_number = WhoNumber.new(params[:who_number])

    respond_to do |format|
      if @who_number.save
        format.html { redirect_to(@who_number, :notice => 'WhoNumber was successfully created.') }
        format.xml  { render :xml => @who_number, :status => :created, :location => @who_number }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_number.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_numbers/1
  # PUT /who_numbers/1.xml
  def update
    @who_number = WhoNumber.find(params[:id])

    respond_to do |format|
      if @who_number.update_attributes(params[:who_number])
        format.html { redirect_to(@who_number, :notice => 'WhoNumber was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_number.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_numbers/1
  # DELETE /who_numbers/1.xml
  def destroy
    @who_number = WhoNumber.find(params[:id])
    @who_number.destroy

    respond_to do |format|
      format.html { redirect_to(who_numbers_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
