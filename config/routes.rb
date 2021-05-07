Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :movies, only: [:create, :show]
  resources :ratings
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  # has to be after devise_for :users or users/edit goes to show action
  get 'users', to: 'users#index'
  get 'users/index', to: 'users#index'
  get 'users/:id', to: 'users#show'
  resources :users, :only =>[:show] 
end
