Rails.application.routes.draw do
  root to: 'reviews#index'
  resources  :reviews do
    resources :comments
    resource :bookmark
  end
  resource :session
  resources :users
end
