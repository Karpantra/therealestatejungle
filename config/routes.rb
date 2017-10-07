Rails.application.routes.draw do

  # mailbox folder routes
    get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
    get "mailbox/sent" => "mailbox#sentbox", as: :mailbox_sentbox
    get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  mount Attachinary::Engine => "/attachinary"


  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  root to: 'pages#home'

  get 'pages/contact'
  get 'pages/concept'
  get 'pages/tarifs'
  get 'pages/cgu'

 resources :users, only: [:update] do
   collection do
     get "dashboard"
   end
 end

  resources :demands

  resources :coworkings do
    resources :briefs, only: [:new, :create]
  end


  resources :briefs do
    post :decline, on: :member
    post :cancel, on: :member
    resources :propositions do
      post :accept, on: :member
      post :cancel, on: :member
      post :decline, on: :member
    end
  end

  resources :chat_rooms, only: [:show] do
    resources :messages, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
