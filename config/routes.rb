ImaBoldTest::Application.routes.draw do


  root 'products#index'

  #============PRODUCTS ROUTES================
  resources :products do
    collection do
      post 'ws_gateway'
      post 'filter'
    end
    member do
      post 'activate'
      post 'deactivate'
    end
  end
  #==============CATEGORY ROUTES==============
  match 'categories/', to:'categories#create', :via => :post, as: ''
  match 'get_categories', to:'categories#get_categories', :via => :get, as: 'get_categories'
  #===========================================


  
end
