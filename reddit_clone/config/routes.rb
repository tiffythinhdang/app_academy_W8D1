Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subs do 
    resources :posts, only: [:new]
  end
  
  resources :posts, only: [:edit, :update, :create, :destroy, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :users
end
