class WhoMembersController < ApplicationController
  # GET /who_members
  # GET /who_members.xml
  def index
    @who_members = WhoMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @who_members }
      format.json  { 
	  	@results = Hash.new
		@who_members.each do |item| 
			@results[item.id] = item.data_to_frontend
		end 

	  	render :json => @results 
	}
    end
  end

  # GET /who_members/1
  # GET /who_members/1.xml
  def show
    @who_member = WhoMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who_member }
    end
  end

  # GET /who_members/new
  # GET /who_members/new.xml
  def new
    @who_member = WhoMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who_member }
    end
  end

  # GET /who_members/1/edit
  def edit
    @who_member = WhoMember.find(params[:id])
  end

  # POST /who_members
  # POST /who_members.xml
  def create
    @who_member = WhoMember.new(params[:who_member])

    respond_to do |format|
      if @who_member.save
        format.html { redirect_to(@who_member, :notice => 'WhoMember was successfully created.') }
        format.xml  { render :xml => @who_member, :status => :created, :location => @who_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /who_members/1
  # PUT /who_members/1.xml
  def update
    @who_member = WhoMember.find(params[:id])

    respond_to do |format|
      if @who_member.update_attributes(params[:who_member])
        format.html { redirect_to(@who_member, :notice => 'WhoMember was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /who_members/1
  # DELETE /who_members/1.xml
  def destroy
    @who_member = WhoMember.find(params[:id])
    @who_member.destroy

    respond_to do |format|
      format.html { redirect_to(who_members_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
