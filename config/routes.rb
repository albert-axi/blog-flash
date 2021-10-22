Rails.application.routes.draw do
  resources :users
  resources :categories

  resources :authors, only: [:index, :show] do 
    resources :posts, only: [:show, :index, :new] 
  end

  resources :posts

  namespace 'admin' do
    resources :posts
  end
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
