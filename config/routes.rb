Rails.application.routes.draw do
<<<<<<< HEAD
  resources :records, only: %i[index new create]
=======
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
>>>>>>> 90172d5566168eb94d63936b7bd4214c0b2f4559
end
