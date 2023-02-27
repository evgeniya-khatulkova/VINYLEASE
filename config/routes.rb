Rails.application.routes.draw do
  resources :records, only: %i[index new create]
end
