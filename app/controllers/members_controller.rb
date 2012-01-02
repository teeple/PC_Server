class MembersController < ApplicationController
  include JsonMapper
  # GET /members
  # GET /members.xml
  def index
    @members = Member.all(:include => [:user_role_type, :user_class_type], :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
      format.json  { 
	  	temp_array = []
	  	@members.each do |member|
	  		temp_array << mapping_to_hash(member, Member.json_mapping_table)
		end 
	  	render :json => temp_array
	  }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id], :include => [:user_role_type, :user_class_type])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
      format.json  {
	  	render :json => mapping_to_hash(@member, Member.json_mapping_table)
	  }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new

	@member.user_id = params[:user_id].blank? ? nil: params[:user_id]
	@member.user_name = params[:user_name].blank? ? nil: params[:user_name]
	@member.hashed_password = params[:hashed_password].blank? ? nil: params[:hashed_password]
	@member.phone = params[:phone].blank? ? nil: params[:phone]
	@member.email = params[:email].blank? ? nil: params[:email]
	@member.accessed_at = Time.now 

	# find code factor id corresponding to user_class 
	#################################################
	code_factor = CodeFactor.find(:first, :conditions => ["code_id = ? and name =? ", 8, params["user_class"].upcase])
	@member.user_class = code_factor.blank? ? nil: code_factor.id

	# find code factor id corresponding to user_role
	#################################################
	code_factor = CodeFactor.find(:first, :conditions => ["code_id = ? and name =? ", 8, params["user_role"].upcase])
	@member.user_role = code_factor.blank? ? nil: code_factor.id

    respond_to do |format|
      if @member.save
        format.html { redirect_to(@member, :notice => 'Member was successfully created.') }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
        format.json  { render :json => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
        format.json  { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id], :include => [:user_role_type, :user_class_type])

	@member.user_id = params[:user_id].blank? ? nil: params[:user_id]
	@member.user_name = params[:user_name].blank? ? nil: params[:user_name]
	@member.hashed_password = params[:hashed_password].blank? ? nil: params[:hashed_password]
	@member.phone = params[:phone].blank? ? nil: params[:phone]
	@member.email = params[:email].blank? ? nil: params[:email]
	@member.accessed_at = Time.now 

	# find code factor id corresponding to user_class 
	#################################################
	code_factor = CodeFactor.find(:first, :conditions => ["code_id = ? and name =? ", 8, params["user_class"].upcase])
	@member.user_class = code_factor.blank? ? nil: code_factor.id

	# find code factor id corresponding to user_role
	#################################################
	code_factor = CodeFactor.find(:first, :conditions => ["code_id = ? and name =? ", 8, params["user_role"].upcase])
	@member.user_role = code_factor.blank? ? nil: code_factor.id

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to(@member, :notice => 'Member was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
        format.json  { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
