BusSystem::Application.routes.draw do
  root :to => 'mains#index'
  resources :mains, :only => [:index]
  resources :stations
  resources :lines
  resources :buses, :except => [:show]
  resources :schedules, :only => [:new, :create]
end
