ActionController::Routing::Routes.draw do |map|
	
	# Transfers
	map.connect 'accounts/transfer', :conditions => { :method => :get }, :controller => 'accounts', :action => 'transfer'
	map.connect 'accounts/transfer', :conditions => { :method => :post }, :controller => 'accounts', :action => 'save_transfer'
	
	map.resources :accounts
	map.resources :operations
	
	# Operations
	map.root :controller => "operations", :action => 'summary'
	map.connect 'operations/summary', :controller => "operations", :action => 'summary'
	map.connect 'operations/summary/:date', :controller => "operations", :action => 'summary'
	
	# Defatult
	map.connect ':controller/:action/:id'
	map.connect ':controller/:action/:id.:format'
	
end
