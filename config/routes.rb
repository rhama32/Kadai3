Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:show, :edit, :index, :update, :new, :create, :destroy]

  devise_scope :user do
   post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end