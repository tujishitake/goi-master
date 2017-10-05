Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get 'flashcards/bookmarks', to: 'flashcards#bookmarks'
  
 #  post 'copy', to: 'decks#copy'

  resources :users, only: [:show, :new, :create, :index]
  
  resources :decks, only: [:show, :new, :create, :edit, :update, :destroy] do
       member do
          post 'copy', to: 'decks#copy'
      end
  end
  
  resources :flashcards, only: [:create, :update, :destroy]
end
