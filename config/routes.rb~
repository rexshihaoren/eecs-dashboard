Rottenpotatoes::Application.routes.draw do
  resources :viewquota

  get '/dashboard/', :controller => 'dashboard', :action => 'index'
  get '/viewquotas/', :controller => 'viewquotas', :action => 'index'
  get '/view_billing/', :controller => 'viewbilling', :action => 'index'
  get '/viewdependants/', :controller => 'viewdependants', :action => 'index'
  post '/viewquotas/', :controller => 'viewquotas', :action => 'change_quota'
  root :to => redirect('/dashboard')
end
