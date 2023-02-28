Rails.application.routes.draw do
  root to: "records#index"
  resources :records do
    resources :reservations do
      resources :reviews, only: %i[index new create show destroy]
       end
    end
  devise_for :users

  # only: %i[index new create]
end
