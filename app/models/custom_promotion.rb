class CustomPromotion < ActiveRecord::Base

    def data_to_ruleset(prd_attribute)
        returns = []

        product = self.products[0]
        product_name = prd_attribute.name.downcase.gsub " ", "_"
        prodcut_code = prd_attribute.code
        prd_type = prd_attribute.prd_type.downcase 

        rule_cnt = 0

        service_ids = CodeFactor.find(:all, :conditions => "code_id = 6")
        service_ids.each do |service_id|

            rule_name = "rule_" + prd_attribute.id.to_s + "_" + rule_cnt.to_s
            rule_element = rule_name + set_ruleset_element(service_id.name, prd_type, prd_attribute)
            returns << rule_element
            rule_cnt += 1
        end
    end

    def set_ruleset_element(service_id, prd_type, prd_attribute)
        custom_promotion = CustomPromotion.new

        case service_id
            when 'PC_SUBSCRIBE':
                custom_promotion.service_id = service_id
                custom_promotion.product_code = prd_attribute.code
                custom_promotion.promotion_service_id = 'SET_COUNTER'
                custom_promotion.priority = '1'
                custom_promotion.promotion_category = 'subscribe_bonus'
                custom_promotion.promotion_parameter = sprintf("'counter_list=%s_subscription'", prd_attribute.name.downcase)

            when 'PC_DEPOSIT':

            when 'PC_RECHARGE':

        end
    end
end
