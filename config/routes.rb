Rails.application.routes.draw do
  root to: "pages#home"
  resources :records
  devise_for :users

  # only: %i[index new create]
end
