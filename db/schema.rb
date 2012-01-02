# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111207085558) do

  create_table "action_allows", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "give"
    t.integer  "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "subfctr_code"
    t.integer  "lock_version", :default => 0
    t.integer  "currency"
  end

  create_table "action_custom_factors", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "operation"
    t.integer  "action_custom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",        :default => 0
    t.integer  "tariff_file_list_id"
  end

  create_table "action_customs", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "subfctr_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "lock_version", :default => 0
  end

  create_table "action_deduct_factors", :force => true do |t|
    t.integer  "upto_start"
    t.integer  "upto_end"
    t.integer  "upto_type"
    t.integer  "tariff_id"
    t.integer  "action_deduct_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",     :default => 0
  end

  create_table "action_deducts", :force => true do |t|
    t.string   "subfctr_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "subfctr_code"
    t.integer  "lock_version", :default => 0
  end

  create_table "action_discounts", :force => true do |t|
    t.string   "subfctr_name"
    t.integer  "upto"
    t.integer  "rate"
    t.integer  "uptounit"
    t.integer  "rateunit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "subfctr_code"
    t.integer  "lock_version", :default => 0
  end

  create_table "actions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "additional_services", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "vas_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",       :default => 0
    t.integer  "rate"
    t.integer  "currency_factor_id"
    t.string   "code"
  end

  create_table "balances", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "canbe_promotional"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "balance_type"
    t.integer  "scale"
    t.string   "code"
    t.integer  "suffix"
    t.integer  "lock_version",      :default => 0
    t.string   "charging_target"
    t.string   "type"
    t.string   "free_charged"
    t.string   "expire_date"
    t.integer  "reset_cycle"
  end

  create_table "card_types", :force => true do |t|
    t.string   "price_model"
    t.string   "price_model_nm"
    t.float    "price"
    t.float    "real_price"
    t.string   "svc_type"
    t.float    "ext_days"
    t.date     "crtdt"
    t.string   "crt_user"
    t.date     "updtdt"
    t.string   "updt_user"
    t.string   "pgm_id"
    t.string   "sale_item"
    t.string   "recharge_item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ccbs_bundle_products", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "product_type"
    t.string   "status"
    t.string   "crtdt"
    t.text     "packaged_product_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ccbs_packaged_products", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "product_type"
    t.string   "status"
    t.date     "crtdt"
    t.text     "package_product_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ccbs_product_tariffs", :force => true do |t|
    t.string   "product_code"
    t.string   "method"
    t.integer  "add_unit"
    t.float    "unit_charge"
    t.float    "suspamt"
    t.float    "validity_term"
    t.string   "crt_user"
    t.string   "updt_user"
    t.date     "crtdt"
    t.date     "updtdt"
    t.string   "pgm_id"
    t.float    "min_unitcharge"
    t.float    "max_unitcharge"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "item_code"
  end

  create_table "ccbs_products", :force => true do |t|
    t.string   "service_type"
    t.string   "product_code"
    t.string   "product_name"
    t.string   "description"
    t.string   "billing_type"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "product_type"
    t.string   "status"
    t.string   "device_list"
    t.date     "crtdt"
    t.text     "condition_list"
    t.text     "item_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "code_factors", :force => true do |t|
    t.string   "name"
    t.integer  "code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "codes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "conditions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "crm_products", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service_type"
    t.string   "product_code"
    t.string   "product_name"
    t.string   "description"
    t.string   "billing_type"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "product_type"
    t.string   "status"
    t.string   "device_list"
    t.string   "crtdt"
  end

  create_table "cs_product_addinfos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cs_product_conditions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cs_product_vas", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cs_products", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_promotions", :force => true do |t|
    t.integer  "service_code_id"
    t.string   "product_code"
    t.string   "promotion_service_id"
    t.integer  "priority"
    t.string   "promotion_category"
    t.string   "promotion_parameter"
    t.string   "package"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbs_deposit_thresholds", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbs_deposits", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbs_rating_factors", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deposit_thresholds", :force => true do |t|
    t.integer  "threhold"
    t.string   "action"
    t.integer  "deposit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deposits", :force => true do |t|
    t.integer  "product_id"
    t.integer  "balance_id"
    t.integer  "deposit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etcs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exclusive_subs", :force => true do |t|
    t.integer  "prd_attribute_id"
    t.integer  "exclusive_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exclusives", :force => true do |t|
    t.integer  "prd_attribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "members", :force => true do |t|
    t.string   "user_name"
    t.integer  "user_class"
    t.integer  "user_role"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.datetime "accessed_at"
    t.string   "hashed_password"
    t.string   "user_id"
  end

  create_table "prd_additional_services", :force => true do |t|
    t.integer  "additional_service_id"
    t.string   "vas_type"
    t.string   "bill_cycle",            :limit => 20,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.float    "rate"
    t.string   "currency"
    t.integer  "lock_version",                        :default => 0
  end

  create_table "prd_attribute_devices", :force => true do |t|
    t.integer  "code_factor_id"
    t.integer  "prd_attribute_id"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  create_table "prd_attributes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "status_id"
    t.string   "prd_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bill_type_id"
    t.integer  "lock_version",     :default => 0
    t.string   "ref_products"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "subscription_fee"
    t.integer  "monthly_fee"
    t.string   "target_user"
    t.integer  "service_type_id"
    t.integer  "rollover"
  end

  create_table "prd_balance_conditions", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "condition_id"
    t.string   "condition_type"
    t.integer  "prd_balance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",   :default => 0
  end

  create_table "prd_balances", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "balance_id"
    t.integer  "priority"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "prd_etcs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prd_members", :force => true do |t|
    t.string   "user_id"
    t.string   "role"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "status"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",    :default => 0
    t.integer  "member_id"
  end

  create_table "prd_promotion_factors", :force => true do |t|
    t.string   "operation"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prd_promotion_rule_id"
    t.string   "name"
    t.integer  "lock_version",          :default => 0
    t.string   "cond_or_result"
  end

  create_table "prd_promotion_rules", :force => true do |t|
    t.integer  "prd_promotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",     :default => 0
  end

  create_table "prd_promotions", :force => true do |t|
    t.integer  "promotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.string   "description"
    t.integer  "lock_version", :default => 0
  end

  create_table "prd_subscriptions", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "condition_id"
    t.integer  "balance_id"
    t.integer  "action_id"
    t.string   "action_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "condition_type"
    t.integer  "product_id"
    t.integer  "lock_version",   :default => 0
  end

  create_table "prd_tariffs", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "condition_id"
    t.string   "condition_type"
    t.integer  "action_id"
    t.string   "action_type"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",   :default => 0
  end

  create_table "prd_thresholds", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "condition_id"
    t.string   "condition_type"
    t.integer  "action_id"
    t.string   "action_type"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "balance_id"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name",                            :null => false
    t.integer  "lock_version",     :default => 0
    t.integer  "prd_attribute_id"
  end

  create_table "promotion_factors", :force => true do |t|
    t.string   "name"
    t.integer  "promotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cond_or_result"
    t.string   "is_required"
    t.integer  "lock_version",   :default => 0
  end

  create_table "promotions", :force => true do |t|
    t.string   "name"
    t.string   "action_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "code"
    t.integer  "lock_version", :default => 0
  end

  create_table "rating_factors", :force => true do |t|
    t.integer  "basic_product_id"
    t.integer  "packaged_product_id"
    t.string   "factor"
    t.string   "function"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relation_exclusives", :force => true do |t|
    t.integer  "packaged_product_id"
    t.integer  "basic_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relation_subs", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "prd_attribute_id"
    t.integer  "relation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relation_subscriptions", :force => true do |t|
    t.integer  "packaged_product_id"
    t.integer  "basic_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.integer  "relation_type_id"
  end

  create_table "sub_deposits", :force => true do |t|
    t.integer  "threshold"
    t.string   "action"
    t.integer  "deposit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_relations", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "prd_attribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "relation_id"
  end

  create_table "tariff_file_lists", :force => true do |t|
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.string   "header"
    t.text     "body"
  end

  create_table "tariff_lists", :force => true do |t|
    t.string   "prefix_region"
    t.float    "d_unit"
    t.float    "d_tariff"
    t.float    "n_unit"
    t.float    "n_tariff"
    t.integer  "tariff_file_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariffs", :force => true do |t|
    t.string   "name"
    t.decimal  "unit",                :precision => 10, :scale => 1
    t.integer  "unit_type"
    t.decimal  "rate",                :precision => 10, :scale => 1
    t.integer  "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",                                       :default => 0
    t.integer  "tariff_file_list_id"
  end

  create_table "test_tests", :force => true do |t|
    t.string   "fidl1"
    t.integer  "fld2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_tests", :force => true do |t|
    t.datetime "time_test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "what_custom_factors", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "operation"
    t.integer  "what_custom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",   :default => 0
  end

  create_table "what_customs", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "what_factors", :force => true do |t|
    t.string   "fctr_code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_factor_id"
    t.integer  "rating_group"
    t.integer  "what_urlgroup_id"
    t.integer  "what_qo_id"
    t.integer  "what_custom_id"
    t.integer  "lock_version",     :default => 0
    t.string   "default_flag"
    t.integer  "service_type"
    t.integer  "target"
  end

  create_table "what_qos", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.integer  "level1"
    t.integer  "level2"
    t.integer  "level3"
    t.integer  "level4"
    t.integer  "level5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "what_urlgroup_factors", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "what_urlgroup_id"
    t.integer  "lock_version",     :default => 0
  end

  create_table "what_urlgroups", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "when_custom_factors", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "operation"
    t.integer  "when_custom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",   :default => 0
  end

  create_table "when_customs", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "when_day_factors", :force => true do |t|
    t.string   "day"
    t.string   "day_type"
    t.integer  "when_day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "when_days", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "when_duration_factors", :force => true do |t|
    t.string   "start_date"
    t.string   "end_date"
    t.integer  "when_duration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",     :default => 0
  end

  create_table "when_durations", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "when_factors", :force => true do |t|
    t.string   "fctr_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "name"
    t.integer  "when_duration_id"
    t.integer  "when_week_id"
    t.integer  "when_day_id"
    t.integer  "when_timeslot_id"
    t.integer  "when_custom_id"
    t.integer  "lock_version",     :default => 0
    t.string   "default_flag"
    t.integer  "service_type"
    t.integer  "target"
  end

  create_table "when_timeslot_factors", :force => true do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.integer  "when_timeslot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",     :default => 0
  end

  create_table "when_timeslots", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "when_weeks", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.integer  "sun"
    t.integer  "mon"
    t.integer  "tue"
    t.integer  "wed"
    t.integer  "thu"
    t.integer  "fri"
    t.integer  "sat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "is_holiday"
    t.integer  "lock_version", :default => 0
  end

  create_table "where_countries", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "where_country_factors", :force => true do |t|
    t.integer  "where_country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",     :default => 0
    t.string   "country_code"
  end

  create_table "where_custom_factors", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "operation"
    t.integer  "where_custom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",    :default => 0
  end

  create_table "where_customs", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "where_factors", :force => true do |t|
    t.string   "fctr_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "name"
    t.integer  "where_country_id"
    t.integer  "where_zone_id"
    t.integer  "where_network_id"
    t.integer  "where_custom_id"
    t.integer  "lock_version",     :default => 0
    t.string   "default_flag"
    t.integer  "service_type"
    t.integer  "target"
  end

  create_table "where_network_factors", :force => true do |t|
    t.string   "network"
    t.integer  "where_network_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",     :default => 0
  end

  create_table "where_networks", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "where_zone_factors", :force => true do |t|
    t.string   "title",         :limit => 250
    t.string   "lat"
    t.string   "lng"
    t.integer  "where_zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",                 :default => 0
  end

  create_table "where_zones", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "who_countries", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.string   "is_same_country"
    t.string   "is_same_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",    :default => 0
  end

  create_table "who_country_factors", :force => true do |t|
    t.integer  "who_country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",   :default => 0
    t.string   "country_code"
  end

  create_table "who_country_sames", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.string   "is_same_country"
    t.string   "is_same_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",    :default => 0
  end

  create_table "who_custom_factors", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "operation"
    t.integer  "who_custom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",  :default => 0
  end

  create_table "who_customs", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "who_factors", :force => true do |t|
    t.string   "fctr_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "name"
    t.integer  "who_member_id"
    t.integer  "who_number_id"
    t.integer  "who_prefix_id"
    t.integer  "who_country_id"
    t.integer  "who_custom_id"
    t.integer  "lock_version",   :default => 0
    t.string   "default_flag"
    t.integer  "service_type"
    t.integer  "target"
  end

  create_table "who_members", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.string   "viceversa"
    t.string   "onoffnet"
    t.string   "memberof"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
    t.string   "age_op_type"
    t.string   "gender"
    t.integer  "lock_version", :default => 0
  end

  create_table "who_number_factors", :force => true do |t|
    t.string   "number"
    t.integer  "who_number_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",  :default => 0
  end

  create_table "who_numbers", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

  create_table "who_prefix_factors", :force => true do |t|
    t.string   "prefix"
    t.integer  "who_prefix_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",  :default => 0
  end

  create_table "who_prefixes", :force => true do |t|
    t.string   "subfctr_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", :default => 0
  end

end
