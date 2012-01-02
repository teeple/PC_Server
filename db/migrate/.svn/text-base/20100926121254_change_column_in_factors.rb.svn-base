class ChangeColumnInFactors < ActiveRecord::Migration
  def self.up
  	add_column :when_factors, :when_duration_id, :integer
  	add_column :when_factors, :when_week_id, :integer
  	add_column :when_factors, :when_day_id, :integer
  	add_column :when_factors, :when_timeslot_id, :integer
  	add_column :when_factors, :when_custom_id, :integer

  	add_column :where_factors, :where_country_id, :integer
  	add_column :where_factors, :where_zone_id, :integer
  	add_column :where_factors, :where_network_id, :integer
  	add_column :where_factors, :where_custom_id, :integer

  	add_column :who_factors, :who_member_id, :integer
  	add_column :who_factors, :who_number_id, :integer
  	add_column :who_factors, :who_prefix_id, :integer
  	add_column :who_factors, :who_country_id , :integer
  	add_column :who_factors, :who_custom_id, :integer

  end

  def self.down
  	remove_column :when_factors, :when_duration_id
  	remove_column :when_factors, :when_week_id
  	remove_column :when_factors, :when_day_id
  	remove_column :when_factors, :when_timeslot_id
  	remove_column :when_factors, :when_custom_id

   	remove_column :where_factors, :where_country_id
  	remove_column :where_factors, :where_zone_id
  	remove_column :where_factors, :where_network_id
  	remove_column :where_factors, :where_custom_id

  	remove_column :who_factors, :who_member_id
  	remove_column :who_factors, :who_number_id
  	remove_column :who_factors, :who_prefix_id
  	remove_column :who_factors, :who_country_id
  	remove_column :who_factors, :who_custom_id
 end

end
