Rails.application.routes.draw do
  resources :bands do 
    resources :albums, only: [:new]
  end
  
  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new]
  end
  
  resources :tracks, except: [:new, :index]
  
  resources :users, only: [:create, :new, :show] 
  
  resource :session, only: [:create, :new, :destroy]
end
