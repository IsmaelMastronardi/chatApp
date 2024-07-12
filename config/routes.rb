Rails.application.routes.draw do
  devise_for :users
  resources :chats, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end

  root "chats#index"
end
