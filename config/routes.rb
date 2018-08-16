Rails.application.routes.draw do
  resources :inventories
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

  get'home', to: 'static_pages#home', as: :home
  root :to => 'static_pages#index'
end
