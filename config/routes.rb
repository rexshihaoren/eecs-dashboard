Rottenpotatoes::Application.routes.draw do
  resources :dashboard
  resources :viewquota

  get '/viewquotas/', :controller => 'viewquotas', :action => 'index'
  root :to => redirect('/dashboard')
end
