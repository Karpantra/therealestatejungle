Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  # get 'coworkings/new'

  # get 'coworkings/index'

  # get 'coworkings/show'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get 'pages/contact'
  get 'pages/concept'
  get 'pages/tarifs'

  # resources :users do
  #   resources :demands, only: [:index, :edit, :update, :destroy]
  # end

  resources :demands #, only: [:index, :new, :create, :update, :destroy]

  resources :coworkings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
