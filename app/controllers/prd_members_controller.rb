class PrdMembersController < ApplicationController
  # GET /prd_members
  # GET /prd_members.xml
  def index
    @prd_members = PrdMember.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_members }
    end
  end

  # GET /prd_members/1
  # GET /prd_members/1.xml
  def show
    @prd_member = PrdMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_member }
    end
  end

  # GET /prd_members/new
  # GET /prd_members/new.xml
  def new
    @prd_member = PrdMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_member }
    end
  end

  # GET /prd_members/1/edit
  def edit
    @prd_member = PrdMember.find(params[:id])
  end

  # POST /prd_members
  # POST /prd_members.xml
  def create
    @prd_member = PrdMember.new(params[:prd_member])

    respond_to do |format|
      if @prd_member.save
        format.html { redirect_to(@prd_member, :notice => 'PrdMember was successfully created.') }
        format.xml  { render :xml => @prd_member, :status => :created, :location => @prd_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prd_members/1
  # PUT /prd_members/1.xml
  def update
    @prd_member = PrdMember.find(params[:id])

    respond_to do |format|
      if @prd_member.update_attributes(params[:prd_member])
        format.html { redirect_to(@prd_member, :notice => 'PrdMember was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prd_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_members/1
  # DELETE /prd_members/1.xml
  def destroy
    @prd_member = PrdMember.find(params[:id])
    @prd_member.destroy

    respond_to do |format|
      format.html { redirect_to(prd_members_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
