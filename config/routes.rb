BusSystem::Application.routes.draw do
  root :to => 'stations#index'
  resources :stations
  resources :lines
end
