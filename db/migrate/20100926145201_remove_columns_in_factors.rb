class RemoveColumnsInFactors < ActiveRecord::Migration
  def self.up
  	remove_column :when_customs, :name
  	remove_column :when_customs, :value
  	remove_column :when_customs, :operation

  	remove_column :where_customs, :name
  	remove_column :where_customs, :value
  	remove_column :where_customs, :operation

  	remove_column :who_customs, :name
  	remove_column :who_customs, :value
  	remove_column :who_customs, :operation

	remove_column :when_days, :day
	remove_column :when_days, :day_type

	remove_column :when_durations, :start_date
	remove_column :when_durations, :end_date

	remove_column :when_factors, :duration_name
	remove_column :when_factors, :date_name
	remove_column :when_factors, :timeslot_name
	remove_column :when_factors, :custom_name
	remove_column :when_factors, :day_name

	remove_column :when_timeslots, :start_time
	remove_column :when_timeslots, :end_time

	remove_column :where_countries, :country_inex

	remove_column :where_factors, :country_name
	remove_column :where_factors, :zone_name
	remove_column :where_factors, :network_name
	remove_column :where_factors, :custom_name

	remove_column :where_networks, :network

	remove_column :where_zones, :title
	remove_column :where_zones, :lat
	remove_column :where_zones, :lng

	#remove_column :where_countries, :country_index

	remove_column :who_factors, :member_name
	remove_column :who_factors, :number_name
	remove_column :who_factors, :prefix_name
	remove_column :who_factors, :country_name
	remove_column :who_factors, :custom_name

	remove_column :who_numbers, :number

	remove_column :who_prefixes, :prefix
  end

  def self.down
   	add_column :when_customs, :name, :string 
  	add_column :when_customs, :value, :string 
  	add_column :when_customs, :operation, :string 

  	add_column :where_customs, :name, :string 
  	add_column :where_customs, :value, :string 
  	add_column :where_customs, :operation, :string 

  	add_column :who_customs, :name, :string 
  	add_column :who_customs, :value, :string 
  	add_column :who_customs, :operation, :string 

	add_column :when_days, :day, :string 
	add_column :when_days, :day_type, :string 

	add_column :when_durations, :start_date, :string 
	add_column :when_durations, :end_date, :string 

	add_column :when_factors, :duration_name, :string 
	add_column :when_factors, :date_name, :string 
	add_column :when_factors, :timeslot_name, :string 
	add_column :when_factors, :custom_name, :string 
	add_column :when_factors, :day_name, :string 

	add_column :when_timeslots, :start_time, :string 
	add_column :when_timeslots, :end_time, :string 

	add_column :when_countries, :country_inex, :string

	add_column :where_factors, :country_name, :string 
	add_column :where_factors, :zone_name, :string 
	add_column :where_factors, :network_name, :string 
	add_column :where_factors, :custom_name, :string 

	add_column :where_networks, :network, :string 

	add_column :where_zones, :title, :string 
	add_column :where_zones, :lat, :string 
	add_column :where_zones, :lng, :string 

	#add_column :where_countries, :country_index, :string

	add_column :who_factors, :member_name, :string
	add_column :who_factors, :number_name, :string
	add_column :who_factors, :prefix_name, :string
	add_column :who_factors, :country_name, :string
	add_column :who_factors, :custom_name, :string

	add_column :who_numbers, :number, :string

	add_column :who_prefixes, :prefix, :string
  end
end
