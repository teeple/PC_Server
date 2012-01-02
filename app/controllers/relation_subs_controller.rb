class RelationSubsController < ApplicationController
  # GET /relation_subs
  # GET /relation_subs.xml
  def index
    @relation_subs = RelationSub.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relation_subs }
      format.json  { render :json => @relation_subs }
    end
  end

  # GET /relation_subs/1
  # GET /relation_subs/1.xml
  def show
    @relation_sub = RelationSub.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relation_sub }
      format.json  { render :json => @relation_sub }
    end
  end

  # GET /relation_subs/new
  # GET /relation_subs/new.xml
  def new
    @relation_sub = RelationSub.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relation_sub }
      format.json  { render :json => @relation_sub }
    end
  end

  # GET /relation_subs/1/edit
  def edit
    @relation_sub = RelationSub.find(params[:id])
  end

  # POST /relation_subs
  # POST /relation_subs.xml
  def create
    @relation_sub = RelationSub.new(params[:relation_sub])

    respond_to do |format|
      if @relation_sub.save
        format.html { redirect_to(@relation_sub, :notice => 'RelationSub was successfully created.') }
        format.xml  { render :xml => @relation_sub, :status => :created, :location => @relation_sub }
        format.json  { render :json => @relation_sub, :status => :created, :location => @relation_sub }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @relation_sub.errors, :status => :unprocessable_entity }
        format.json  { render :json => @relation_sub.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relation_subs/1
  # PUT /relation_subs/1.xml
  def update
    @relation_sub = RelationSub.find(params[:id])

    respond_to do |format|
      if @relation_sub.update_attributes(params[:relation_sub])
        format.html { redirect_to(@relation_sub, :notice => 'RelationSub was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relation_sub.errors, :status => :unprocessable_entity }
        format.json  { render :json => @relation_sub.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relation_subs/1
  # DELETE /relation_subs/1.xml
  def destroy
    @relation_sub = RelationSub.find(params[:id])
    @relation_sub.destroy

    respond_to do |format|
      format.html { redirect_to(relation_subs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
