Rails.application.routes.draw do

  get 'users/dashboard'

  mount Attachinary::Engine => "/attachinary"

  # get 'coworkings/new'

  # get 'coworkings/index'

  # get 'coworkings/show'
  # devise_for :users,
  # controllers: { registrations: 'registrations' }

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }


  root to: 'pages#home'

  get 'pages/contact'
  get 'pages/concept'
  get 'pages/tarifs'

 resources :users, only: [:update] do
   collection do
     get "dashboard"
   end
 end

  resources :demands #, only: [:index, :new, :create, :update, :destroy]

  resources :coworkings do
    resources :briefs, only: [:new, :create]
  end

  resources :briefs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
