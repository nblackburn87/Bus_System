BusSystem::Application.routes.draw do
  root :to => 'mains#index'
  resources :mains, :only => [:index]
  resources :stations
  resources :lines
end
