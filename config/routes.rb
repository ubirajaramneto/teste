ImaBoldTest::Application.routes.draw do


  root 'products#index'

  #============PRODUCTS ROUTES================
  resources :products
  match 'products/destroy_selected', to:'products#destroy_selected', :via => :delete, :as => 'destroy_selected'
  match 'products/:id/activate', to: 'products#activate', :via => :put, :as => 'activate'
  match 'products/:id/deactivate', to: 'products#deactivate', :via => :put, :as => 'deactivate'
  match 'products/activate_selected', to: 'products#activate_selected', :via => :put, :as => 'activate_selected'
  match 'products/deactivate_selected', to: 'products#deactivate_selected', :via => :put, :as => 'deactivate_selected'
  
  #==============CATEGORY ROUTES==============
  match 'categories/', to:'categories#create', :via => :post, as: ''
  match 'get_categories', to:'categories#get_categories', :via => :get, as: 'get_categories'
  #===========================================


  
end
