Rottenpotatoes::Application.routes.draw do
  resources :dashboard
  resources :viewquota

  get '/viewquotas/', :controller => 'viewquotas', :action => 'index'
  post '/viewquotas/', :controller => 'viewquotas', :action => 'change_quota'
  root :to => redirect('/dashboard')
end
