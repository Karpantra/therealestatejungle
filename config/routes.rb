Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"


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


  resources :demands

  resources :coworkings do
    resources :briefs, only: [:new, :create]
  end

  resources :briefs

  resources :chat_rooms, only: [:show] do
    resources :messages, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
