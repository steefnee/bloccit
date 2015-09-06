Rails.application.routes.draw do
  resources :topics do
# #34
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
# #5
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'


 end
