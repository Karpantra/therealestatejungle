Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users do
    resources :demands, only: [:new, :create, :index]
  end

  resources :demands, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
