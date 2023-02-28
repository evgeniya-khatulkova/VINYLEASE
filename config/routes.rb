Rails.application.routes.draw do
  root to: "records#index"
  resources :records
  devise_for :users

  # only: %i[index new create]
end
