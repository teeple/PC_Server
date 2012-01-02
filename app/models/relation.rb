class Relation < ActiveRecord::Base
    has_many :relation_subs,
            :dependent => :destroy 
    belongs_to :relation_type,
            :class_name => :CodeFactor,
            :foreign_key => :relation_type_id

    @@json_mapping_table = {
        "id"            => {:value => "id", :type => :OBJECT_FIELD},
        "code"          => {:value => "code", :type => :OBJECT_FIELD},
        "name"          => {:value => "name", :type => :OBJECT_FIELD},
        "type"          => {:value => "relation_type_id", :type => :OBJECT_FIELD},
        "description"   => {:value => "description", :type => :OBJECT_FIELD},
        # "products"      => {:value => "@relation_subs", :type => :HAS_CHILD_MULTI_PRD_ATTRIBUTE}
        "products"      => {:value => "@relation_subs", :type => :HAS_CHILD_MULTI_AND_DUMMY}
    }

    def self.json_mapping_table
        return @@json_mapping_table
    end

    # ccbs에 packaged product관련된 상품 정보를 넣어들고 함
    def send_to_ccbs
        require 'open-uri'
        conditions = "relation_id = " + self.id.to_s + " and (parent_id = 0 or parent_id = null)"

        relation_subs_root = RelationSub.find(:all,
                :conditions => conditions, :include => :prd_attribute)

        f = open("http://localhost:3000/ccbs_products/"+ relation_subs_root[0].prd_attribute.id.to_s + ".json")
        webpage = f.read
        f.close
    end

    # dbserv에 packaged product관련된 상품 정보를 넣어주돌고 함
    #
    def send_to_dbserv
        conditions = "relation_id = " + self.id.to_s + " and (parent_id = 0 or parent_id = null)"
        relation_subs_root = RelationSub.find(:all, 
                :conditions => conditions, :include => :prd_attribute )
        relation_subs  = relation_subs_root[0].leafnodes
        relation_subs.each { |relation_sub|

            existing_dbserv_factors = []
            packaged_product = relation_sub.prd_attribute.products[0]

            conditions = "product_id = " + packaged_product.id.to_s + " and ((condition_id != 0 or condition_id != null) or (action_id !=0 or action_id !=null)) "
            prd_tariffs = PrdTariff.find(:all, :conditions => conditions)

            dbserv_rating_factors = []

            conditions = "code_id = 15"
            code_factors = CodeFactor.find(:all, :conditions => conditions)
            code_factors.each { |code_factor| 
                dbserv_rating_factors << code_factor.name
            }
            rating_factors = []

            prd_tariffs.each { |prd_tariff| 
                factor_name, factor_value = check_factor_name_value(prd_tariff)

                if existing_dbserv_factors.include? factor_name 
                    existing_dbserv_factors << factor_name
                end
                if existing_dbserv_factors.include? factor_value
                    existing_dbserv_factors << factor_value
                end
           }

            existing_dbserv_factors.uniq!

            existing_dbserv_factors.each { |rating_factor| 

                if not rating_factor.nil?
                    dbs_rating_factor = DbsRatingFactor.new
                    dbs_rating_factor.product_code = relation_subs_root[0].prd_attribute.code
                    dbs_rating_factor.product_name = relation_subs_root[0].prd_attribute.name 
                    dbs_rating_factor.packaged_code = relation_sub.prd_attribute.code
                    dbs_rating_factor.packaged_name = relation_sub.prd_attribute.name

                    debugger
                    dbs_rating_factor.factor = RATING_FACTOR[rating_factor]['factor']
                    dbs_rating_factor.function = RATING_FACTOR[rating_factor]['function']
                    begin
                        dbs_rating_factor.save!
                    rescue => e
                    end
                end
            }
        }
    end


    def check_factor_name_value(object)

        if not object.condition_type.nil?
            case object.condition_type.upcase
                when 'WHATFACTOR':
                    factor_name = object.condition.what_custom.what_custom_factors[0].name  if not object.condition.what_custom.nil?
                    factor_value = object.condition.what_custom.what_custom_factors[0].value  if not object.condition.what_custom.nil?

                when 'WHOFACTOR':
                    factor_name = object.condition.who_custom.who_custom_factors[0].name  if not object.condition.who_custom.nil?
                    factor_value = object.condition.who_custom.who_custom_factors[0].value  if not object.condition.who_custom.nil?

                when 'WHEREFACTOR':
                    factor_name = object.condition.where_custom.where_custom_factors[0].name  if not object.condition.where_custom.nil?
                    factor_value = object.condition.where_custom.where_custom_factors[0].value  if not object.condition.where_custom.nil?

                when 'WHENFACTOR':
                    factor_name = object.condition.when_custom.when_custom_factors[0].name  if not object.condition.when_custom.nil?
                    factor_value = object.condition.when_custom.when_custom_factors[0].value  if not object.condition.when_custom.nil?

            end
        end

        if not object.action_type.nil?
            case object.action_type.upcase
                #when 'ACTIONDEDUCT':
                #    factor_name = object.action.action_deduct.action_deduct_factors[0].name  if not object.action.action_deduct.nil?
                #    factor_value = object.action.action_deduct.actino_deduct_factors[0].value  if not object.action.action_deduct.nil?

                #when 'ACTIONALLOW':
                #    factor_name = object.action.action_allow.action_allow_factors[0].name  if not object.action.action_allow.nil?
                #    factor_value = object.action.action_allow.action_allow_factors[0].value  if not object.action.action_allow.nil?

                #when 'ACTIONDISCOUNT':
                #    factor_name = object.action.action_discount.action_discount_factors[0].name  if not object.action.action_discount.nil?
                #    factor_value = object.action.action_discount.action_discount_factors[0].value  if not object.action.action_discount.nil?
#
                when 'ACTIONCUSTOM':
                    factor_name = object.action.action_custom_factors[0].name  if not object.action.action_custom_factors.nil?
                    factor_value = object.action.action_custom_factors[0].value  if not object.action.action_custom_factors.nil?
            end
        end

        return factor_name, factor_value
    end
end
