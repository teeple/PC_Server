class AddLockVersionInAllTables < ActiveRecord::Migration
  def self.up
  	add_column :actions, :lock_version, :integer, :default => 0
  	add_column :action_allows, :lock_version, :integer, :default => 0
  	add_column :action_customs, :lock_version, :integer, :default => 0
  	add_column :action_custom_factors, :lock_version, :integer, :default => 0
  	add_column :action_deducts, :lock_version, :integer, :default => 0
  	add_column :action_deduct_factors, :lock_version, :integer, :default => 0
  	add_column :action_discounts, :lock_version, :integer, :default => 0
  	add_column :additional_services, :lock_version, :integer, :default => 0
  	add_column :balances, :lock_version, :integer, :default => 0
  	add_column :codes, :lock_version, :integer, :default => 0
  	add_column :code_factors, :lock_version, :integer, :default => 0
  	add_column :conditions, :lock_version, :integer, :default => 0
  	add_column :exports, :lock_version, :integer, :default => 0
  	add_column :prd_additional_services, :lock_version, :integer, :default => 0
  	add_column :prd_attributes, :lock_version, :integer, :default => 0
  	add_column :prd_balances, :lock_version, :integer, :default => 0
  	add_column :prd_balance_conditions, :lock_version, :integer, :default => 0
  	add_column :prd_members, :lock_version, :integer, :default => 0
  	add_column :prd_promotions, :lock_version, :integer, :default => 0
  	add_column :prd_promotion_factors, :lock_version, :integer, :default => 0
  	add_column :prd_promotion_rules, :lock_version, :integer, :default => 0
  	add_column :prd_subscriptions, :lock_version, :integer, :default => 0
  	add_column :prd_tariffs, :lock_version, :integer, :default => 0
  	add_column :products, :lock_version, :integer, :default => 0
  	add_column :promotions, :lock_version, :integer, :default => 0
  	add_column :promotion_factors, :lock_version, :integer, :default => 0
  	add_column :tariffs, :lock_version, :integer, :default => 0
  	add_column :what_customs, :lock_version, :integer, :default => 0
  	add_column :what_custom_factors, :lock_version, :integer, :default => 0
  	add_column :what_factors, :lock_version, :integer, :default => 0
  	add_column :what_qos, :lock_version, :integer, :default => 0
  	add_column :what_urlgroups, :lock_version, :integer, :default => 0
  	add_column :what_urlgroup_factors, :lock_version, :integer, :default => 0
  	add_column :when_customs, :lock_version, :integer, :default => 0
  	add_column :when_custom_factors, :lock_version, :integer, :default => 0
  	add_column :when_days, :lock_version, :integer, :default => 0
  	add_column :when_day_factors, :lock_version, :integer, :default => 0
  	add_column :when_durations, :lock_version, :integer, :default => 0
  	add_column :when_duration_factors, :lock_version, :integer, :default => 0
  	add_column :when_factors, :lock_version, :integer, :default => 0
  	add_column :when_timeslots, :lock_version, :integer, :default => 0
  	add_column :when_timeslot_factors, :lock_version, :integer, :default => 0
  	add_column :when_weeks, :lock_version, :integer, :default => 0
  	add_column :where_countries, :lock_version, :integer, :default => 0
  	add_column :where_country_factors, :lock_version, :integer, :default => 0
  	add_column :where_customs, :lock_version, :integer, :default => 0
  	add_column :where_custom_factors, :lock_version, :integer, :default => 0
  	add_column :where_factors, :lock_version, :integer, :default => 0
  	add_column :where_networks, :lock_version, :integer, :default => 0
  	add_column :where_network_factors, :lock_version, :integer, :default => 0
  	add_column :where_zones, :lock_version, :integer, :default => 0
  	add_column :where_zone_factors, :lock_version, :integer, :default => 0
  	add_column :who_countries, :lock_version, :integer, :default => 0
  	add_column :who_country_factors, :lock_version, :integer, :default => 0
  	add_column :who_country_sames, :lock_version, :integer, :default => 0
  	add_column :who_customs, :lock_version, :integer, :default => 0
  	add_column :who_custom_factors, :lock_version, :integer, :default => 0
  	add_column :who_factors, :lock_version, :integer, :default => 0
  	add_column :who_members, :lock_version, :integer, :default => 0
  	add_column :who_numbers, :lock_version, :integer, :default => 0
  	add_column :who_number_factors, :lock_version, :integer, :default => 0
  	add_column :who_prefixes, :lock_version, :integer, :default => 0
  	add_column :who_prefix_factors, :lock_version, :integer, :default => 0
  end

  def self.down
  	remove_column :actions, :lock_version
  	remove_column :action_allows, :lock_version
  	remove_column :action_customs, :lock_version
  	remove_column :action_custom_factors, :lock_version
  	remove_column :action_deducts, :lock_version
  	remove_column :action_deduct_factors, :lock_version
  	remove_column :action_discounts, :lock_version
  	remove_column :additional_services, :lock_version
  	remove_column :balances, :lock_version
  	remove_column :codes, :lock_version
  	remove_column :code_factors, :lock_version
  	remove_column :conditions, :lock_version
  	remove_column :exports, :lock_version
  	remove_column :prd_additional_services, :lock_version
  	remove_column :prd_attributes, :lock_version
  	remove_column :prd_balances, :lock_version
  	remove_column :prd_balance_conditions, :lock_version
  	remove_column :prd_members, :lock_version
  	remove_column :prd_promotions, :lock_version
  	remove_column :prd_promotion_factors, :lock_version
  	remove_column :prd_promotion_rules, :lock_version
  	remove_column :prd_subscriptions, :lock_version
  	remove_column :prd_tariffs, :lock_version
  	remove_column :products, :lock_version
  	remove_column :promotions, :lock_version
  	remove_column :promotion_factors, :lock_version
  	remove_column :tariffs, :lock_version
  	remove_column :what_customs, :lock_version
  	remove_column :what_custom_factors, :lock_version
  	remove_column :what_factors, :lock_version
  	remove_column :what_qos, :lock_version
  	remove_column :what_urlgroups, :lock_version
  	remove_column :what_urlgroup_factors, :lock_version
  	remove_column :when_customs, :lock_version
  	remove_column :when_custom_factors, :lock_version
  	remove_column :when_days, :lock_version
  	remove_column :when_day_factors, :lock_version
  	remove_column :when_durations, :lock_version
  	remove_column :when_duration_factors, :lock_version
  	remove_column :when_factors, :lock_version
  	remove_column :when_timeslots, :lock_version
  	remove_column :when_timeslot_factors, :lock_version
  	remove_column :when_weeks, :lock_version
  	remove_column :where_countries, :lock_version
  	remove_column :where_country_factors, :lock_version
  	remove_column :where_customs, :lock_version
  	remove_column :where_custom_factors, :lock_version
  	remove_column :where_factors, :lock_version
  	remove_column :where_networks, :lock_version
  	remove_column :where_network_factors, :lock_version
  	remove_column :where_zones, :lock_version
  	remove_column :where_zone_factors, :lock_version
  	remove_column :who_countries, :lock_version
  	remove_column :who_country_factors, :lock_version
  	remove_column :who_country_sames, :lock_version
  	remove_column :who_customs, :lock_version
  	remove_column :who_custom_factors, :lock_version
  	remove_column :who_factors, :lock_version
  	remove_column :who_members, :lock_version
  	remove_column :who_numbers, :lock_version
  	remove_column :who_number_factors, :lock_version
  	remove_column :who_prefixes, :lock_version
  	remove_column :who_prefix_factors, :lock_version
  end
end
