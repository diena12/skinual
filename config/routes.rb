Rails.application.routes.draw do
  root to: 'skinual#index'
  # Devise
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Skinual
  get '/',                        to: 'skinual#index'
  get '/question',                to: 'skinual#question'
  get 'answer',                   to: 'skinual#answer'
  # Review
  resources :reviews,             only: [:new, :create, :edit]
  resources :reviews do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
  end
  get '/reviews/:id',             to: 'reviews#show'
  get '/reviews',                 to: 'reviews#index'
  get '/reviews/item',            to: 'reviews#search'

  # Category
  get '/categories/:id',          to: 'categories#show'
  # Like
  resources :reviews do
    resources :likes,               only: [:create, :destroy]
  end
  # Mypage
  resources :mypages,             only: [:show, :edit, :update] do
    member do
      get :review_lists
      get :like_reviews
      get :comment_lists
    end
  end
  
  #Comment
  resources :reviews do    
    resources :comments, only: [:create]  
  end
end
