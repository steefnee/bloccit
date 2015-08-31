Rails.application.routes.draw do
  resources :sponsored_posts
  resources :topics do
# #34
    resources :posts, except: [:index]
  end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
 end
