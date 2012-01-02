class ProductsController < ApplicationController
    require 'open-uri'

  # GET /products
  # GET /products.xml
  def index
    @products = Product.all(:include => [:prd_attribute, :prd_members, :prd_subscriptions, :prd_tariffs, :prd_balances, :prd_thresholds, :prd_promotions, :prd_additional_services], :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
      format.json  { 
	  	@returns = Hash.new 
	  	@results = []

		begin 
			@products.each do |product|

				@results << mapping_to_hash(product.prd_attribute, PrdAttribute.json_mapping_table)
			end
	  		render :json => @results
		rescue  => e
			render :json => @errors
		end
     }
	 format.rule {
	 	@product_list_output = []

		begin
			@products.each do |product|
				if not product.data_to_ruleset_list.blank? 
					@product_list_output << product.data_to_ruleset_list + "\n" 
				end
			end
			render :rule => @product_list_output
		rescue => e
			render :rule => @errors
		end

		@output = render_to_string(:file => TMPL_PATH + RULE['Product']['tmpl_list'])
		file_name = RULE_PATH + RULE["Product"]["rule_list"]
		File.delete(file_name)

		file = File.new(file_name, "w")
		file << @output
		file.close

		render :rule => @output 
	 }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    
	product_id = params[:id]
    @product = Product.find(params[:id], :include => [:prd_attribute, :prd_members, :prd_subscriptions, :prd_tariffs, :prd_balances, :prd_thresholds, :prd_promotions, :prd_additional_services])
    @prd_attribute = @product.prd_attribute

    respond_to do |format|

      format.html # show.html.erb
      format.xml  { render :xml => @product }
      format.json  { 
	  	render :json => mapping_to_hash(@product, Product.json_mapping_table)
	  }
	  format.rule {

        @output = make_rules(product_id, @product.prd_attribute.name)
        render :rule => @output

	  	#@prd_subscriptions_output = make_rules_from_subscriptions(params[:id])
		#render :file => TMPL_PATH + RULE['PrdSubscription']['tmpl'] 
	  }
	  format.db {
	  	#send_to_cs(@product.prd_attribute, @product.prd_subscriptions, @product.prd_promotions, @product.prd_additional_services)

		render :template => TMPL_PATH + RULE['Product']['tmpl_html']
	  }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
      format.json  { render :json => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

	respond_to do |format|
		format.html { 
			if @product.save
				redirect_to(@product, :notice => 'Product was successfully created.') 
			else
				format.html { render :action => "new" }
			end
		}
		format.xml { 
			if @product.save 
				render :xml => @product, :status => :created, :location => @product
			else
				render :xml => @product.errors, :status => :unprocessable_entity
			end
		}
		format.json {
			@prd_attribute = PrdAttribute.new

			begin 
				Product.transaction do 
					@product.save
					@prd_attribute.mapping_and_save(params['prd_attribute'], @product.id)
                    @product.mapping_and_save(params['prd_attribute'], @product)
				end
				returns = mapping_to_hash(@prd_attribute, PrdAttribute.json_mapping_table)
				render :json => returns, :status => :created, :location => @product
			rescue
				render :json => @product.errors, :status => :unprocessable_entity
			end

		}
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    logger.info "PUT method"

    @product = Product.find(params[:id], :include => [:prd_attribute, :prd_members, :prd_subscriptions, :prd_tariffs, :prd_balances, :prd_thresholds, :prd_promotions, :prd_additional_services])

    product_id = @product.id

	case params[:target]
		when "prd_attibute": 
		when "prd_subscriptions":
			PrdSubscription.save_to_db(params['prd_subscriptions'], product_id)

		when "prd_tariffs":
			PrdTariff.save_to_db(params['prd_tariffs'], product_id)

		when "prd_balances":
			PrdBalance.save_to_db(params['prd_balances'], product_id)

		when "prd_thresholds":
			PrdThreshold.save_to_db(params['prd_thresholds'], product_id)

		when "prd_promotions":
			PrdPromotion.save_to_db(params['prd_promotions'], product_id)

		when "prd_additional_services":

			PrdAdditionalService.save_to_db(params['prd_additional_services'], product_id)
            @prd_attribute = @product.prd_attribute
   		    # send_to_cs(@product.prd_attribute, @product.prd_subscriptions, @product.prd_promotions, @product.prd_additional_services )

            #f = open("http://localhost:3000/ccbs_products/"+@prd_attribute.id.to_s+'.json')

            #debugger
            #webpage = f.read
            #f.close

		    #make_rules(product_id, @product.prd_attribute.name)
	end

    respond_to do |format|
      if @product.update_attributes(@put_product)
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
        format.json  { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    #delete_rules()

    respond_to do |format|
      format.html { redirect_to(products_url) }
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

      return output
  end

  # charging_account에 대한 rule을 생성한다.
  # 
  def save_to_ruleset_charging_account(name, param1)
      product_name = name.downcase.gsub " ", "_"
      saved = []
      is_exist = 0

      ## charging_account.rule ##
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

            debugger

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

