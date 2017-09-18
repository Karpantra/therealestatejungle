Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get 'pages/contact'
  get 'pages/concept'
  get 'pages/tarifs'

  resources :users do
    resources :demands, only: [:new, :create, :index, :edit, :update]
  end

  resources :demands, only: [:create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
