Rails.application.routes.draw do
  # resources :instagrams, only: [:index, :new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # match '/' => 'author#create', via: :get

  # resources :authors do 
  #   resources :entries
  # end

  root 'author#home'
  resources :author do
    resources :entries
  end
  
  # match '/author'=> 'author#create', via: :get
  match '/author'=> 'author#create', via: :post
  match '/entries' => 'entries#index', via: :post
  # match '/entries' => 'entries#index', via: :get
  match '/author/entries' => 'entries#create', via: :post, as: '/author_journal_entries'
  post 'author/:id/entries/new', to: 'entries#new'
  # get 'authors/:id/edit', to: 'authors#edit'
  # put 'authors/:id', to: 'authors#update'

end
