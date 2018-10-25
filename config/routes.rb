Rails.application.routes.draw do
  root to: 'users#my_address'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [] do
    collection do
      post :assign_address
      get :my_address
    end
  end
  namespace :api, defaults: { format: :json } do 
    devise_for :users
    resources :users, only: [] do
      collection do
        get :view_address
        post :create_address
      end
    end
  end
end
