Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get'home', to: 'static_pages#home', as: :home
  get'public', to: 'static_pages#public', as: :public
  root :to => 'static_pages#index'
end
