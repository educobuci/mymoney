ActionController::Routing::Routes.draw do |map|
	
	map.resources :operations
	map.resources :tags
	
	# Transfers
	map.connect 'accounts/transfer', :conditions => { :method => :get }, :controller => 'accounts', :action => 'transfer'
	map.connect 'accounts/transfer', :conditions => { :method => :post }, :controller => 'accounts', :action => 'save_transfer'
	map.resources :accounts
	
	# Operations
	map.root :controller => "operations", :action => 'summary'
	map.connect 'operations/summary', :controller => "operations", :action => 'summary'
	map.connect 'operations/summary/:date', :controller => "operations", :action => 'summary'
	
	# Defatult
	map.connect ':controller/:action/:id'
	map.connect ':controller/:action/:id.:format'
	
end
