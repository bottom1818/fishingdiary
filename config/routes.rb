Rails.application.routes.draw do
  
  root 'tops#index'

  resources :users
  
  resources :sessions
  
  resources :favorites, only: [:create, :destroy]
  
  resources :events do
    collection do
      post :confirm
    end
  end
  get '/events', to: 'events#index'
  
  get '/caught_fishes/new/:event_id', to: 'caught_fishes#new', as: 'new_caught_fish'
  get '/caught_fishes/:event_id', to: 'caught_fishes#index', as: 'caught_fishes'
  get '/caught_fishes/:event_id/:id', to: 'caught_fishes#show', as: 'caught_fish'
  get '/caught_fishes/:event_id/:id/edit', to: 'caught_fishes#edit', as: 'edit_caught_fish'
  post '/caught_fishes/:event_id', to: 'caught_fishes#create', as: 'create_caught_fish'
  delete '/caught_fishes/:event_id/:id', to: 'caught_fishes#destroy', as: 'destroy_caught_fish'
  patch '/caught_fishes/:event_id/:id', to: 'caught_fishes#update', as: 'update_caught_fish'

  resources :tops do
  end
  
end
