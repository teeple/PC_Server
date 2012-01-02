class RelationsController < ApplicationController
  # GET /relations
  # GET /relations.xml
  def index
    @relations = Relation.all(:include => :relation_subs)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relations }
      format.json  {
          @results = []

          @relations.each do |relation|
            @results << mapping_to_hash(relation, Relation.json_mapping_table)
          end
          render :json => @results
      }
    end
  end

  # GET /relations/1
  # GET /relations/1.xml
  def show
    @relation = Relation.find(params[:id], :include => :relation_subs)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relation }
      format.json {

          if (not params[:target].nil? and params[:target].downcase == 'dbs')
              if @relation.relation_type_id == 116 # EXCLUSIVE
                @relation.send_to_dbserv
              end

              output = "ok"
          else
            output =  mapping_to_hash(@relation, Relation.json_mapping_table)
          end
          render :json => output

      }
      #format.dbs  { 
      #    render :db => mapping_to_hash(@relation, Relation.json_mapping_table)
      #}
    end
  end

  # GET /relations/new
  # GET /relations/new.xml
  def new
    @relation = Relation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relation }
      format.json  { render :json => @relation }
    end
  end

  # GET /relations/1/edit
  def edit
    @relation = Relation.find(params[:id])
  end

  # POST /relations
  # POST /relations.xml
  def create
    #@relation = Relation.new(params[:relation], :include => :relation_subs)
    @relation = Relation.new

    @relation.code = params[:relation][:code]
    @relation.name = params[:relation][:name]
    @relation.relation_type_id = params[:relation][:type]
    @relation.description = params[:relation][:description]

    respond_to do |format|
      if @relation.save
        format.html { redirect_to(@relation, :notice => 'Relation was successfully created.') }
        format.xml { render :xml => @relation, :status => :created, :location => @relation }
        format.json {
            @relation.save!

            output = mapping_to_hash(@relation, Relation.json_mapping_table)
            output_to_hash = Hash["relation" => output]

            render :json => output_to_hash, :status => :created, :location => @relation }
        format.db  {

            if @relation.relation_type.name.upcase == 'EXCLUSIVE'
                RelationSub.save_to_db(params['products'],relation_id)

                # @relation.send_to_ccbs()
                @relation.send_to_dbserv
            end

            render :db => @relation, :status => :created, :location => @relation 
        }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @relation.errors, :status => :unprocessable_entity }
        format.json  { 
            render :json => @relation.errors, :status => :unprocessable_entity 
        }
      end
    end
  end

  # PUT /relations/1
  # PUT /relations/1.xml
  def update
    #@relation = Relation.find(params[:id])

    debugger

    @relation = Relation.find(params[:id], :include => :relation_subs)
    RelationSub.save_to_db(params['relation']['products'], @relation.id)

    respond_to do |format|
      #if @relation.update_attributes(params[:relation])
      #if @relation.update_attributes(put_relation)
      #  format.html { redirect_to(@relation, :notice => 'Relation was successfully updated.') }
      #  format.xml  { head :ok }
        format.json  {
            head :ok 
        }
      #else
      #  format.html { render :action => "edit" }
      #  format.xml  { render :xml => @relation.errors, :status => :unprocessable_entity }
      #  format.json  { render :json => @relation.errors, :status => :unprocessable_entity }
      #end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.xml
  def destroy
    @relation = Relation.find(params[:id])
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to(relations_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end

