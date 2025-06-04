Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end

  resources :habits, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :completion, only: [:create, :destroy]
    post :checkin, on: :member
  end
  

  root to: "habits#index"

  authenticated :user do
    root 'habits#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end

  get "up" => "rails/health#show", as: :rails_health
end
