class PromotionsController < ApplicationController
  include JsonMapper
  # GET /promotions
  # GET /promotions.xml
  def index
    @promotions = Promotion.all(:include => [:promotion_factors, :factor_conditions, :factor_results], :order => "id DESC" )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @promotions }
      format.json  { 

		@returns = []
		@promotions.each do |promotion|
			@returns << mapping_to_hash(promotion, Promotion.json_mapping_table)
		end 
	  	render :json => @returns
	  }
	  format.rule {
		@promotion_list_output = []
		@promotion_list_value_output = []

		if @promotions != nil && @promotions.size > 0 
			@promotions.each do |promotion|
				temp_array_conditions = []
				temp_array_results = []

				promotion.promotion_factors.each do |factor|
					case factor.cond_or_result 
						when "COND" :
							temp_array_conditions << factor.name

						when "RESULT" : 
							temp_array_results << factor.name
					end 

				end 

				row = "action = " + promotion.action_type

				if temp_array_conditions.size > 0 
					row += ", required_condition = (" + temp_array_conditions.join(",") + ") " 
				end 

				if temp_array_results.size > 0 
					row += ", required_result = (" + temp_array_results.join(",") + ") " 
				end 
				@promotion_list_output << promotion.name.downcase + ": " + row + "\n"
				@promotion_list_value_output  << promotion.name.downcase + "\n"
			end
		end

		@output_rule = render_to_string(:file => TMPL_PATH + RULE['Promotion']['tmpl_list'])
		@output_value = render_to_string(:file => TMPL_PATH + RULE['Promotion']['tmpl_value'])

		file_name_rule = RULE_PATH + RULE['Promotion']['rule_list']
		File.delete(file_name_rule) if File.exist?(file_name_rule)

		file = File.new(file_name_rule, "w")
		file << @output_rule
		file.close

		file_name_value = RULE_PATH + RULE['Promotion']['value_list']
		File.delete(file_name_value) if File.exist?(file_name_value)

		file = File.new(file_name_value, "w")
		file << @output_value
		file.close

		render :rule => [@output_rule, @output_value]
	}
    end
  end

  # GET /promotions/1
  # GET /promotions/1.xml
  def show
    @promotion = Promotion.find(params[:id], :include => [:promotion_factors, :factor_conditions, :factor_results] )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @promotion }
      format.json  { 
	  	render :json => mapping_to_hash(@promotion, Promotion.json_mapping_table)
	  }
    end
  end

  # GET /promotions/new
  # GET /promotions/new.xml
  def new
    @promotion = Promotion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @promotion }
    end
  end

  # GET /promotions/1/edit
  def edit
    @promotion = Promotion.find(params[:id])
  end

  # POST /promotions
  # POST /promotions.xml
  def create
    @promotion = Promotion.new

    respond_to do |format|

        format.html { 
			@promotion = Promotion.new(params[:promotion])

			redirect_to(@promotion, :notice => 'Promotion was successfully created.') }
        format.xml  { 
			@promotion = Promotion.new(params[:promotion])
			render :xml => @promotion, :status => :created, :location => @promotion }
        format.json  { 

			@promotion.action_type = params[:promotion][:action_type]
			@promotion.name = params[:promotion][:name]
			@promotion.code = params[:promotion][:code]
			@promotion.description = params[:promotion][:description]

			if @promotion.save
				conditions = params[:promotion][:conditions]
				if not conditions.blank? 
					conditions.each do |condition|
						promotion_factor = PromotionFactor.new
						promotion_factor.name = condition[:name]
						promotion_factor.promotion_id = @promotion.id
						promotion_factor.cond_or_result = "COND"
						promotion_factor.is_required = "YES"
						promotion_factor.save
					end 
				end

				results = params[:promotion][:results]
				if not results.blank?
					params[:promotion][:results].each do |condition|	
						promotion_factor = PromotionFactor.new
						promotion_factor.name = condition[:name]
						promotion_factor.promotion_id = @promotion.id
						promotion_factor.cond_or_result = "RESULT"
						promotion_factor.is_required = "YES"
						promotion_factor.save
					end
				end
			end

			render :json => @promotion, :status => :created, :location => @promotion 	
          }
      #else
      #  format.html { render :action => "new" }
      #  format.xml  { render :xml => @promotion.errors, :status => :unprocessable_entity }
      #  format.json  { 
	#		render :json => @promotion.errors, :status => :unprocessable_entity 		}
    #  end
    end
  end

  # PUT /promotions/1
  # PUT /promotions/1.xml
  def update
    @promotion = Promotion.find(params[:id])

    respond_to do |format|
		format.html {
      		if @promotion.update_attributes(params[:promotion])
				redirect_to(@promotion, :notice => 'Promotion was successfully updated.')
			else
        		render :action => "edit"
			end 
		}
        format.xml  { 
      		if @promotion.update_attributes(params[:promotion])
				head :ok 
			else
        		render :xml => @promotion.errors, :status => :unprocessable_entity
			end
		}
        format.json  {

			temp_promotion = Hash.new
			temp_promotion[:action_type] = params[:promotion][:action_type]
			temp_promotion[:name] = params[:promotion][:name]
			temp_promotion[:code] = params[:promotion][:code]
			temp_promotion[:description]= params[:promotion][:description]

			if @promotion.update_attributes(temp_promotion)			

				PromotionFactor.delete_all(["promotion_id = ?", params[:id]])

				conditions = params[:promotion][:conditions]
				if not conditions.blank? 
					conditions.each do |condition|
						promotion_factor = PromotionFactor.new
						promotion_factor.name = condition[:name]
						promotion_factor.promotion_id = @promotion.id
						promotion_factor.cond_or_result = "COND"
						promotion_factor.is_required = "YES"
						promotion_factor.save
					end 
				end

				results = params[:promotion][:results]
				if not results.blank?
					params[:promotion][:results].each do |condition|	
						promotion_factor = PromotionFactor.new
						promotion_factor.name = condition[:name]
						promotion_factor.promotion_id = @promotion.id
						promotion_factor.cond_or_result = "RESULT"
						promotion_factor.is_required = "YES"
						promotion_factor.save
					end
				end
		
				head :ok 
			else
				render :json => @promotion.errors, :status => :unprocessable_entity 
			end
		}
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.xml
  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy

    respond_to do |format|
      format.html { redirect_to(promotions_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
