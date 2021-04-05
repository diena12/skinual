Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'skinual#index'
  # Devise
  devise_for :users
  devise_scope :user do
    post '/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Skinual
  get '/',                        to: 'skinual#index'
  get '/question',                to: 'skinual#question'
  get 'answer',                   to: 'skinual#answer'
  get '/privacy_policy',          to: 'skinual#privacy'
  # Review
  resources :reviews,             only: [:new, :create, :edit, :destroy]
  resources :reviews do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'search'
    end
  end
  get '/reviews/:id',             to: 'reviews#show'
  get '/reviews',                 to: 'reviews#index'
  # Ranking
  get '/ranking',                 to: 'reviews#ranking'

  # Category
  get '/categories/:id',          to: 'categories#show'
  # Like
  resources :reviews do
    resources :likes,             only: [:create, :destroy]
  end
  # Mypage
  resources :mypages,             only: [:show, :edit, :update] do
    member do
      get :review_lists
      get :like_reviews
      get :comment_lists
    end
  end
  
  # Comment
  resources :reviews do    
    resources :comments, only: [:create]  
  end
end
