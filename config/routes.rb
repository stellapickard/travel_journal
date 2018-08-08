Rails.application.routes.draw do
  # resources :instagrams, only: [:index, :new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/' => 'author#create', via: :get

  resources :authors do 
    resources :entries
  end
end
