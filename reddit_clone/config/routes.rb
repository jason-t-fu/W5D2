Rails.application.routes.draw do
  resources :comments, only: [:create, :show]
  resources :posts do
    resources :comments, only: :new
  end
  resources :subs 
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]
end
