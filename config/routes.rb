ImaBoldTest::Application.routes.draw do


  root 'products#index'

  #============PRODUCTS ROUTES================
  put '/products/deactivate_selected/:id', to: 'products#deactivate_selected', :as => 'deactivate_selected'
  delete 'destroy_selected', to:'products#destroy_selected', :as => 'destroy_selected'
  put 'activate', to: 'products#activate', :as => 'activate'
  put 'deactivate', to: 'products#deactivate', :as => 'deactivate'
  put 'activate_selected', to: 'products#activate_selected', :as => 'activate_selected'
  resources :products do
    collection do
      post 'ws_gateway'
    end
  end
  #==============CATEGORY ROUTES==============
  match 'categories/', to:'categories#create', :via => :post, as: ''
  match 'get_categories', to:'categories#get_categories', :via => :get, as: 'get_categories'
  #===========================================


  
end
