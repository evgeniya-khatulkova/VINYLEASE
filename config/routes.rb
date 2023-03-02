Rails.application.routes.draw do
  root to: "pages#home"
  resources :records, only: %i[new create show destroy update save edit] do
    resources :reservations, only: [:index, :new, :create]
  end

  resources :reservations do
    resources :reviews, only: %i[index new create show destroy]
  end

  devise_for :users

  # only: %i[index new create]
end
