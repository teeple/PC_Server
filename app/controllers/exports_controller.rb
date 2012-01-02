class ExportsController < ApplicationController
  # GET /exports
  # GET /exports.xml
  def index
    @exports = Export.all
	require 'open-uri'                # Required library

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exports }

      format.json {

          #send_to_ccbs
          #send_to_crm
          #send_to_dbs
          send_to_ocs

          render :json => "OK"
      }
      #format.all {
      #    all_list = [
      #      'exports.rule',
      #      'exports.ccbs',
      #      'exports.crm',
      #      'exports.dbs',
      #    ]
      #    all_list.each do |all|
      #      f = open("http://localhost:3000/" + all)
      #      webpage = f.read
      #      f.close
      #    end
#
#      }
      
    end
  end

  # GET /exports/1
  # GET /exports/1.xml
  def show
    @export = Export.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @export }
    end
  end

  # GET /exports/new
  # GET /exports/new.xml
  def new
    @export = Export.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @export }
    end
  end

  # GET /exports/1/edit
  def edit
    @export = Export.find(params[:id])
  end

  # POST /exports
  # POST /exports.xml
  def create
    @export = Export.new(params[:export])

    respond_to do |format|
      if @export.save
        format.html { redirect_to(@export, :notice => 'Export was successfully created.') }
        format.xml  { render :xml => @export, :status => :created, :location => @export }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @export.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exports/1
  # PUT /exports/1.xml
  def update
    @export = Export.find(params[:id])

    respond_to do |format|
      if @export.update_attributes(params[:export])
        format.html { redirect_to(@export, :notice => 'Export was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @export.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exports/1
  # DELETE /exports/1.xml
  def destroy
    @export = Export.find(params[:id])
    @export.destroy

    respond_to do |format|
      format.html { redirect_to(exports_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end      

    def send_to_dbs
        dbs_list = Array.new

        # dbserv에 dbs_rating_factors에 전달
        #
        relations = Relation.all
        relations.each do |relation|
            dbs_list << 'relations/'+relation.id.to_s+'.json?target=dbs'
        end

        dbs_list.each do |element|

            begin
                f = open("http://localhost:3000/"+ element)
                webpage = f.read
                f.close
            rescue => e
            end
        end
    end

    def send_to_ccbs

          basic_list = Array.new
          bundle_list = Array.new

          prd_attributes = PrdAttribute.all

          prd_attributes.each do |prd_attribute|

            if prd_attribute.prd_type.downcase == 'basic'
                basic_list <<  'ccbs_products/'+prd_attribute.id.to_s+'.json'
            elsif prd_attribute.prd_type.downcase == 'bundle'
                bundle_list << 'ccbs_bundle_products/'+prd_attribute.id.to_s+'.json'
            end
          end

          basic_list.each do |element|
              f = open("http://localhost:3000/"+element)
              webpage = f.read
              f.close
          end          
          
          bundle_list.each do |element|
              f = open("http://localhost:3000/"+element)
              webpage = f.read
              f.close
          end
    end

    def send_to_crm
        crm_list = Array.new

          prd_attributes = PrdAttribute.all
          prd_attributes.each do |element|
            crm_list << 'crm_products/'+element.id.to_s+'.json'
          end

          crm_list.each do |element|
            f = open("http://localhost:3000/"+element)
            webpage = f.read
            f.close
          end
    end

    def send_to_ocs

        time_now = Time.now
        Dir.chdir(DATA_PATH.to_s)
        File.delete('rule')
        new_dir = 'rule_' + time_now.strftime("%Y_%m_%d_%H%M%S")
        Dir.mkdir(new_dir)
        system ('ln -s ' + new_dir + ' rule')
        system ('cp -r rule.bak/* rule')

        rule_list = Array.new
        rule_list = [
            'who_factors.rule',
            'where_factors.rule',
            'when_factors.rule',
            'what_factors.rule',
            'actions.rule',
            'balances.rule',
            'promotions.rule',
            'codes.rule',
            'tariffs.rule',
            'prd_attributes.rule'
        ]
        prd_attributes = PrdAttribute.all
        prd_attributes.each do |prd_attribute|
            rule_list << 'prd_attributes/'+prd_attribute.id.to_s+'.rule'
        end

        rule_list.each do |rule_file|

            begin 
                f = open("http://localhost:3000/"+ rule_file)
                webpage = f.read
                f.close
            rescue => e
            end
        end

        #command = "/bin/rating_util reload all " + ENV['SYS_PCHOME'] + "/data/rule" 
        #exec command
    end
end
