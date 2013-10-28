Rottenpotatoes::Application.routes.draw do
  resources :movies
  resources :viewquota

  get '/viewquotas/', :controller => 'viewquotas', :action => 'index'
  #redirect(get '/dashboard/', :controller => 'dashboards', :action => 'index')
  root :to => redirect('/dashboard')
  #root :to => get '/viewquotas'
end
