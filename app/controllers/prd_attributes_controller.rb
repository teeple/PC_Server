class PrdAttributesController < ApplicationController
  include JsonMapper

  # GET /prd_attributes
  # GET /prd_attributes.xml
  def index
    @prd_attributes = PrdAttribute.all(:include => [:products, :prd_attribute_devices], :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prd_attributes }
      format.json  { 
	  	@returns = []

		@prd_attributes.each do |factor|

			@returns << mapping_to_hash(factor, PrdAttribute.json_mapping_table)
		end
	  	render :json => @returns
	  }
	  format.rule {

	  	@prd_attribute_list_output = []

        # prd_attribute_list_output에 product_list.rule에 사용할 row를 정리 
        # 
        @prd_attributes.each do |prd_attribute|
            if not prd_attribute.data_to_ruleset_list.blank?
                @prd_attribute_list_output << prd_attribute.data_to_ruleset_list + "\n"
            end
        end

        # product_list.rule에 대해서 정의함 
        # 
        @output = render_to_string(:file => TMPL_PATH + RULE['PrdAttribute']['tmpl_list'])
        file_name = RULE_PATH + RULE['PrdAttribute']['rule_list']
        File.delete(file_name) if File.exist?(file_name)

        file = File.open(file_name, "w")
        file << @output
        file.close

        # prd_attributres에 대해서 
        #
        #@prd_attributes.each { |prd_attribute|

        #    @prd_conditions_what, @prd_conditions_where, @prd_conditions_when, @prd_conditions_who = [], [], [], []

        #    @prd_conditions = Hash.new
        #    @prd_conditions[:what]  = @prd_conditions_what
        #    @prd_conditions[:where] = @prd_conditions_where
        #    @prd_conditions[:who]   = @prd_conditions_who
        #    @prd_conditions[:when]  = @prd_conditions_when

            # charging_account.rule
            # 
            #@prd_balances_output =  PrdBalance.data_to_prd_ruleset(prd_attribute.products[0].id, @prd_conditions)
            #save_to_ruleset_charging_account(prd_attribute.name, @prd_balances_output)
        #}
        render :rule => @output
	  }
    end
  end

  # GET /prd_attributes/1
  # GET /prd_attributes/1.xml
  def show 
    require 'open-uri'

    @prd_attribute = PrdAttribute.find(params[:id], :include => [:products, :prd_attribute_devices])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prd_attribute }
      format.json  {

	  	render :json => mapping_to_hash(@prd_attribute, PrdAttribute.json_mapping_table)
	  }
      format.rule {
          product = @prd_attribute.products[0]
          f = open("http://localhost:3000/products/"+product.id.to_s+".rule")
          @webpage = f.read
          f.close

          render :rule => @webpage
	  }
    end
  end

  # GET /prd_attributes/new
  # GET /prd_attributes/new.xml
  def new
    @prd_attribute = PrdAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prd_attribute }
      format.json  { render :json => @prd_attribute }
    end
  end

  # GET /prd_attributes/1/edit
  def edit
    @prd_attribute = PrdAttribute.find(params[:id])
  end

  # POST /prd_attributes
  # POST /prd_attributes.xml
  def create

    @prd_attribute = PrdAttribute.new

    @prd_attribute.bill_type_id = params[:prd_attribute]['bill_type'].to_i
    @prd_attribute.name = params[:prd_attribute]['name']
    @prd_attribute.rollover = params[:prd_attribute]['rollover']
    @prd_attribute.code = params[:prd_attribute]['code']
    @prd_attribute.prd_type = params[:prd_attribute]['prd_type']
    @prd_attribute.description = params[:prd_attribute]['description']
    @prd_attribute.status_id = params[:prd_attribute]['status'].to_i

    @prd_attribute.service_type_id = params[:prd_attribute]['service_type'].to_i
    @prd_attribute.monthly_fee = params[:prd_attribute]['monthly_fee'].to_i
    @prd_attribute.subscription_fee = params[:prd_attribute]['subscription_fee'].to_i
    @prd_attribute.target_user = params[:prd_attribute]['target_user']
    @prd_attribute.start_date = params[:prd_attribute]['start_date']
    @prd_attribute.end_date = params[:prd_attribute]['end_date']

    respond_to do |format|
      if @prd_attribute.save
        format.html { redirect_to(@prd_attribute, :notice => 'PrdAttribute was successfully created.') }
        format.xml  { render :xml => @prd_attribute, :status => :created, :location => @prd_attribute }
        format.json  {
			product = Product.new
            product.prd_attribute_id = @prd_attribute.id
            product.save!

            # bundle일 때에는 해당하는 product id들을 저장
            #
            if params[:prd_attribute]['prd_type'].upcase == 'BUNDLE'
                product_ids = []
			    params[:prd_attribute]['ref_products'].each do |product_id|
			        product_ids << product_id['product_id'].to_s
		        end
		        @prd_attribute.ref_products = product_ids.join(",")
            end 
		    @prd_attribute.save

            # product devices 저장
            #
            if not params[:prd_attribute]['devices'].blank?
                params[:prd_attribute]['devices'].each do |device|
                    prd_attribute_device = PrdAttributeDevice.new
                    prd_attribute_device.code_factor_id = device['device'].to_i
                    prd_attribute_device.prd_attribute_id = @prd_attribute.id
                    prd_attribute_device.product_id = product.id
                    prd_attribute_device.save!
                end
            end

            # product에 대한 기본 conditions 설정
            #
            product.set_default_conditions(@prd_attribute, product)

			render :json => mapping_to_hash(@prd_attribute, PrdAttribute.json_mapping_table), :status => :created, :location => @prd_attribute 
		}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prd_attribute.errors, :status => :unprocessable_entity }
        format.json  { 
			render :json => @prd_attribute.errors, :status => :unprocessable_entity 	}
      end
    end
  end

  # PUT /prd_attributes/1
  # PUT /prd_attributes/1.xml
  def update
    @prd_attribute = PrdAttribute.find(params[:id])

    @prd_attribute.code = params[:prd_attribute]['code']
    @prd_attribute.name = params[:prd_attribute]['name']
    @prd_attribute.rollover = params[:prd_attribute]['rollover']
    @prd_attribute.description = params[:prd_attribute]['description']
    @prd_attribute.status_id = params[:prd_attribute]['status'].to_i
    @prd_attribute.prd_type = params[:prd_attribute]['prd_type']
    @prd_attribute.bill_type_id = params[:prd_attribute]['bill_type'].to_i

    @prd_attribute.service_type_id = params[:prd_attribute]['service_type'].to_i
    @prd_attribute.monthly_fee = params[:prd_attribute]['monthly_fee']
    @prd_attribute.subscription_fee = params[:prd_attribute]['subscription_fee']
    @prd_attribute.target_user = params[:prd_attribute]['target_user']
    @prd_attribute.start_date = params[:prd_attribute]['start_date']
    @prd_attribute.end_date = params[:prd_attribute]['end_date']

    respond_to do |format|
        format.html { 
      		if @prd_attribute.update_attributes(params[:prd_attribute]) 
				redirect_to(@prd_attribute, :notice => 'PrdAttribute was successfully updated.') 
			else 
        		format.html { render :action => "edit" }
			end
		}
        format.xml  { 
      		if @prd_attribute.update_attributes(params[:prd_attribute]) 
				head :ok 
			else 		
        		format.xml  { render :xml => @prd_attribute.errors, :status => :unprocessable_entity }
			end
		}
        format.json {

            # bundle일 때에는 해당하는 product id들을 저장
            #
            if params[:prd_attribute]['prd_type'].upcase == 'BUNDLE'
                product_ids = []
			    params[:prd_attribute]['ref_products'].each do |product_id|
			        product_ids << product_id['product_id'].to_s
		        end
		        @prd_attribute.ref_products = product_ids.join(",")
            end 
		    @prd_attribute.save

            # product devices 저장
            #
            if not params[:prd_attribute]['devices'].blank?
                params[:prd_attribute]['devices'].each do |device|
                    prd_attribute_device = PrdAttributeDevice.new
                    prd_attribute_device.code_factor_id = device['device'].to_i
                    prd_attribute_device.prd_attribute_id = @prd_attribute.id
                    prd_attribute_device.product_id = @prd_attribute.products[0].id
                    prd_attribute_device.save!
                end
            end

        	#render :json => @prd_attribute.errors, :status => :unprocessable_entity
			head :ok
	  }
      end
  end

  # DELETE /prd_attributes/1
  # DELETE /prd_attributes/1.xml
  def destroy
    @prd_attribute = PrdAttribute.find(params[:id])
    @prd_attribute.destroy

    #delete_rules()

    respond_to do |format|
      format.html { redirect_to(prd_attributes_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end

  def delete_rules()

    product_name = @prd_attribute.name.downcase.gsub " ","_"
    product_code = @prd_attribute.code

    # delete product_basic_aaa.rule 
    #
    file_name = RULE_PATH + sprintf(RULE["Product"]["rule"], @prd_attribute.prd_type.downcase, product_name)
    File.delete(file_name) if File.exist?(file_name)

    # delete in charging_account.rule
    #
    new_file_name = RULE_PATH+RULE["Balance"]["rule"]
    org_file_name = RULE_PATH+RULE["Balance"]["rule"] + '.bak'
    File.rename(new_file_name, org_file_name)

    matching_option = "[' =']" + product_name +"[' ,']"
    file = File.new(new_file_name)
    File.open(org_file_name).each { |line|
      file.puts(line) unless line.match(matching_option)
    }

    # delete in product_list.rule
    #
    new_file_name = TMPL_PATH + RULE['PrdAttribute']['tmpl_list']
    org_file_name = TMPL_PATH + RULE['PrdAttribute']['tmpl_list'] + '.bak'
    File.rename(new_file_name, org_file_name)

    matching_option = "product_code = '"+product_code+"'"
    file = File.new(new_file_name)
    File.open(org_file_name).each { |line|
      file.puts(line) unless line.match(matching_option)
    }

  end

  # 해당 product에 대한 rule을 만든다
  #
  def make_rules(product_id, product_name)

      @prd_conditions_what, @prd_conditions_where, @prd_conditions_when, @prd_conditions_who = [], [], [], []

      @prd_conditions = Hash.new
      @prd_conditions[:what]  = @prd_conditions_what
      @prd_conditions[:where] = @prd_conditions_where
      @prd_conditions[:who]   = @prd_conditions_who
      @prd_conditions[:when]  = @prd_conditions_when

      @prd_subscriptions_output =
          PrdSubscription.data_to_prd_ruleset(product_id, @prd_conditions)
      @prd_tariffs_output =
          PrdTariff.data_to_prd_ruleset(product_id, @prd_conditions)
      @prd_balances_output =
          PrdBalance.data_to_prd_ruleset(product_id, @prd_conditions)
      @prd_thresholds_output =
          PrdThreshold.data_to_prd_ruleset(product_id, @prd_conditions)

      @prd_conditions_what = @prd_conditions[:what]
      @prd_conditions_where = @prd_conditions[:where]
      @prd_conditions_when = @prd_conditions[:when]
      @prd_conditions_who = @prd_conditions[:who]

      @prd_promotions_output = PrdPromotion.data_to_prd_ruleset(product_id, product_name)
      @prd_additional_services_output = PrdAdditionalService.data_to_prd_ruleset(product_id)

      from_conditions_to_ruleset()

      #save to product ruleset
      #
      output = render_to_string(:file => TMPL_PATH + RULE['Product']['tmpl'])
      save_to_ruleset(output)

      # save to charging account
      #
      #save_to_ruleset_charging_account(@prd_attribute.name, @prd_balances_output)

  end

  # charging_account에 대한 rule을 생성한다.
  # 
  def save_to_ruleset_charging_account(name, param1)
      product_name = name.downcase.gsub " ", "_"
      saved = []
      is_exist = 0

      ## charging_account.rule ##
      ##
      if File.exist?(RULE_PATH+RULE["Balance"]["rule"])
        is_exist = 1
            matching_option = "[' =']" + product_name +"[' ,']"
            file = File.new(RULE_PATH+RULE["Balance"]["rule"])
            file.each do |line|
                if line.include? product_name
                    if not line.match(matching_option)
                        saved << line
                    end 
                else 
                    saved << line
                end
            end 
            file.close

            saved << param1
        end 

        if is_exist == 0

            ## products/charging_account.rule.erb
            ## 
            charging_account_output = render_to_string(:file => TMPL_PATH + RULE['Balance']['tmpl'])

            file = File.new(RULE_PATH+RULE["Balance"]["rule"], "w")
            file << charging_account_output
            file.close
        else
            file = File.new(RULE_PATH+RULE["Balance"]["rule"], "w")
            file << saved
            file.close
        end
    end

    def save_to_ruleset(rule_file)

        # product_[type]_[name].rule
        #
        product_name = @prd_attribute.name.downcase.gsub " ","_"
        file_name = RULE_PATH + sprintf(RULE["Product"]["rule"], @prd_attribute.prd_type.downcase, product_name)

        File.delete(file_name) if File.exist?(file_name)

        file = File.new(file_name, "w")
        file << rule_file 
        file.close
    end

    def save_conditions(condition_id, condition_type)
        case condition_type.downcase
            when 'who':
                @prd_conditions_who << condition_id
            when 'what':
                @prd_conditions_what << condition_id
            when 'where':
                @prd_conditions_where << condition_id
            when 'when':
                @prd_conditions_when << condition_id
            else
        end
    end

    def from_conditions_to_ruleset 

        @prd_conditions_when.uniq!
        @prd_conditions_who.uniq!

        #@ruleset_condition_what_output = []
        @condition_where_output = []
        @condition_when_output = []
        @condition_who_output = []

        #what_factors = WhatFactor.find_by_id(@prd_conditions_what)
        #what_factors.each do |what_factor|
        #end 

        when_factors = WhenFactor.find_all_by_id(@prd_conditions_when)
        when_factors.each do |factor|

            factor.data_to_prd_ruleset
            @condition_when_output << factor.data_to_prd_ruleset
        end

        who_factors = WhoFactor.find_all_by_id(@prd_conditions_who)
        who_factors.each do |factor|
            @condition_who_output << factor.data_to_prd_ruleset
        end

        where_factors = WhereFactor.find_all_by_id(@prd_conditions_where)
        where_factors.each do |factor|
            @condition_where_output << factor.data_to_prd_ruleset
        end
    end

    # data to ruleset 으로 바꿈
    #
    def data_to_ruleset_list

        returns = nil
        if not self.blank?
          if (not self.prd_attribute.blank?) && (not self.prd_attribute.code.blank?)
            product_name = self.prd_attribute.name.downcase.gsub " ", "_"
            returns = sprintf("%s : product_code = '%s' , in_service = 'CCF'", product_name, self.prd_attribute.code, self.prd_attribute.name)
          end
        end
    end
end
