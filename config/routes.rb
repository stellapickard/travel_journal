Rails.application.routes.draw do
  # resources :instagrams, only: [:index, :new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'home#index'

  match '/' => 'author#create', via: :get
  match '/media' => 'entries#index', via: :get
end
