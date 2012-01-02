class RelationSub < ActiveRecord::Base
    belongs_to :relation,
            :class_name => "Relation",
            :foreign_key => "relation_id"
    belongs_to :prd_attribute,
            :class_name => "PrdAttribute",
            :foreign_key => "prd_attribute_id"
    acts_as_tree :order => "id"

    @@json_mapping_table = {
        "id"                => {:value => "id", :type => :DB_FIELD},
        "parent_id"         => {:value => "parent_id", :type => :DB_FIELD},
        "prd_attribute_id"  => {:value => "prd_attribute_id", :type => :DB_FIELD}
    }

    def self.json_mapping_table
        return @@json_mapping_table
    end

    def self.save_to_db( req_relation_subs, relation_id )
        mapping_table = Hash.new
        relation_subs = []

        RelationSub.delete_all(['relation_id = ? ', relation_id])

        req_relation_subs.each do |container|

            relation_sub = RelationSub.new
            relation_sub.relation_id = relation_id

            if relation_sub.save

                mapping_table[container['id']] = relation_sub.id

                relation_sub.parent_id = container['parent_id'].blank? ? nil: container['parent_id']
                relation_sub.prd_attribute_id = container['prd_attribute_id'].blank? ? nil: container['prd_attribute_id']

                relation_sub.relation_id = relation_id
            end
            relation_subs << relation_sub 
        end

        relation_subs.each do |container|

            if mapping_table.has_key? container['parent_id'].to_s
                container.parent_id = mapping_table[container['parent_id'].to_s]
            else
                container.parent_id = 0
            end
            container.save
        end 
    end

    def send_to_ccbs

        conditions = "relation_id =" + @relation.id.to_s+" and (parent_id = 0 or parent_id = null) "
        root = RelationSub.find(:all, :conditions => conditions)
        leaf_nodes = root[0].leafnodes

        leaf_nodes.each do |leafnode|

        end

    end

    def send_to_dbserv

        conditions = "relation_id = " + @relation.id.to_s + " and (parent_id = 0 or parent_id = null)"
        root = RelationSub.find(:all, :conditions => conditions)
        leaf_nodes = root[0].leafnodes

        leaf_nodes.each do |leafnode|
        end

    end

end

