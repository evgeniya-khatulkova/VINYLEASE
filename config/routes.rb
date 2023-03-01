Rails.application.routes.draw do
  root to: "records#index"
  resources :records do
    resources :reservations
  end
  devise_for :users

  # only: %i[index new create]
end
