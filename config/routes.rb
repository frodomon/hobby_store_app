Rails.application.routes.draw do
  resources :doi_types
  resources :delivery_hours
  resources :payment_methods
  resources :sales_order_details
  resources :sales_orders
  resources :delivery_methods
  resources :purchase_order_details
  resources :store_credits
  resources :suppliers
  resources :warehouses
  
  resources :products
  resources :game_lines
  resources :suggested_ages
  resources :thematics
  resources :game_styles
  resources :game_types
  resources :sub_categories
  resources :categories
  resources :ubigeos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	devise_for :users, controllers: { registrations: 'user/registrations', sessions: 'user/sessions', passwords:'user/passwords' },
  path: '', path_names: {
    sign_in: 'login',
    sign_up: 'register',
    password: 'forgot_password'
  }

  resources :inventories do
    collection do
      get 'product_detail/:product_id' => 'inventories#product_detail', as: :product_detail
    end
  end

  resources :purchase_orders do
    collection do
      get 'update_warehouse_from_purchase_order' => 'purchase_orders#update_warehouse_from_purchase_order'
    end
  end


  get '/ubigeo/get/departamentos(.:format)'=>"ubigeos#get_departamentos"
  get '/ubigeo/get/provincias/:departamento(.:format)'=>"ubigeos#get_provincias"
  get '/ubigeo/get/distritos/:provincia(.:format)'=>"ubigeos#get_distritos"
  get '/ubigeo/get/ubigeo/:id(.:format)' =>"ubigeos#get_ubigeo"


  get'home', to: 'static_pages#home', as: :home
  root :to => 'static_pages#index'
end
