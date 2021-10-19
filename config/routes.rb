Rails.application.routes.draw do
  resources :categories
  resources :authors, only: [:index, :show] do 
    resources :posts 
  end

  resources :posts do
    resources :categories
  end

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
