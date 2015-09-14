Rails.application.routes.draw do
   resources :labels, only: [:show]

  resources :topics do
# #34
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
# #5
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote

  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'


 end
