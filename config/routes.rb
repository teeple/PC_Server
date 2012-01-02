ActionController::Routing::Routes.draw do |map|
  map.resources :test_tests

  map.resources :custom_promotions

  map.resources :ccbs_bundle_products

  map.resources :dbs_rating_factors

  map.resources :relation_subs

  map.resources :deposit_thresholds

  map.resources :dbs_deposit_thresholds

  map.resources :dbs_deposits

  map.resources :deposits

  map.resources :ccbs_packaged_products

  map.resources :ccbs_product_tariffs

  map.resources :prd_etcs

  map.resources :ccbs_products

  map.resources :card_types

  map.resources :prd_thresholds

  map.resources :ocs_rating_factors

  map.resources :ocs_rating_factors

  map.resources :rating_factors

  map.resources :crm_products

  map.resources :tariff_lists

  map.resources :rating_factors

  map.resources :relations

  map.resources :tariff_file_lists

  map.resources :events

  map.resources :prd_attribute_devices

  map.resources :members

  map.resources :action_custom_factors

  map.resources :action_customs

  map.resources :what_custom_factors

  map.resources :what_customs

  map.resources :what_urlgroup_factors

  map.resources :what_qos

  map.resources :what_urlgroups

  map.resources :who_prefix_factors

  map.resources :who_number_factors

  map.resources :who_custom_factors

  map.resources :who_country_factors

  map.resources :where_zone_factors

  map.resources :where_network_factors

  map.resources :where_custom_factors

  map.resources :where_country_factors

  map.resources :when_timeslot_factors

  map.resources :when_day_factors

  map.resources :when_custom_factors

  map.resources :when_duration_factors

  map.resources :exports

  map.resources :code_factors

  map.resources :codes

  map.resources :action_deduct_factors

  map.resources :prd_promotion_rules

  map.resources :actions

  map.resources :conditions

  map.resources :tests

  map.resources :time_tests

  map.resources :prd_balance_conditions

  map.resources :tariffs

  map.resources :where_networks

  map.resources :when_customs

  map.resources :where_customs

  map.resources :where_factors

  map.resources :where_factors

  map.resources :when_factors

  map.resources :who_customs

  map.resources :who_countries

  map.resources :who_prefixes

  map.resources :who_numbers

  map.resources :who_members

  map.resources :who_country_sames

  map.resources :where_zones

  map.resources :where_countries

  map.resources :when_weeks

  map.resources :when_timeslots

  map.resources :when_durations

  map.resources :when_days

  map.resources :cs_product_vas

  map.resources :cs_product_addinfos

  map.resources :cs_product_conditions

  map.resources :cs_products

  map.resources :what_factors

  map.resources :action_discounts

  map.resources :action_deducts

  map.resources :action_allows

  map.resources :promotion_factors

  map.resources :prd_members

  map.resources :prd_attributes

  map.resources :additional_services

  map.resources :balances

  map.resources :prd_promotion_factors

  map.resources :prd_additional_services

  map.resources :prd_promotions

  map.resources :promotions

  map.resources :prd_balances

  map.resources :prd_tariffs

  map.resources :products

  map.resources :who_factors

  map.resources :when_factors

  map.resources :where_factors

  map.resources :prd_subscriptions

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.connect 'bill_cycles.json',
               :controller => 'codes',
               :action => 'show',
               :id => 1,
               :format => 'json'

  map.connect 'reset_cycles.json',
               :controller => 'codes',
               :action => 'show',
               :id => 1,
               :format => 'json'

  map.connect 'currencies.json',
               :controller => 'codes',
               :action => 'show',
               :id => 2,
               :format => 'json'

  map.connect 'unit_types.json',
               :controller => 'codes',
               :action => 'show',
               :id => 3,
               :format => 'json'

  map.connect 'bill_dates.json',
               :controller => 'codes',
               :action => 'show',
               :id => 4,
               :format => 'json'

  map.connect 'country_codes.json',
               :controller => 'codes',
               :action => 'show',
               :id => 5,
               :format => 'json'

  map.connect 'what_types.json',
               :controller => 'codes',
               :action => 'show',
               :id => 6,
               :format => 'json'

  map.connect 'user_roles.json',
               :controller => 'codes',
               :action => 'show',
               :id => 7,
               :format => 'json'

  map.connect 'user_classes.json',
               :controller => 'codes',
               :action => 'show',
               :id => 8,
               :format => 'json'

  map.connect 'device_types.json',
               :controller => 'codes',
               :action => 'show',
               :id => 9,
               :format => 'json'

  map.connect 'service_types.json',
               :controller => 'codes',
               :action => 'show',
               :id => 10,
               :format => 'json'

  map.connect 'component_types.json',
               :controller => 'codes',
               :action => 'show',
               :id => 11,
               :format => 'json'

  map.connect 'bill_types.json',
               :controller => 'codes',
               :action => 'show',
               :id => 12,
               :format => 'json'

  map.connect 'rating_factors.json',
               :controller => 'codes',
               :action => 'show',
               :id => 13,
               :format => 'json'

  map.connect 'product_status.json',
               :controller => 'codes',
               :action => 'show',
               :id => 14,
               :format => 'json'

  map.connect 'relation_types.json',
               :controller => 'codes',
               :action => 'show',
               :id => 17,
               :format => 'json'


  map.connect 'etc',
               :controller => 'prd_etcs',
               :action => 'index',
               :format => 'html'

end
