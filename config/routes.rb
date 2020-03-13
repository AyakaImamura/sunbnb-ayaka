Rails.application.routes.draw do
  get 'rooms/new'
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:show]
  resources :rooms do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
  end

  # devise_for :users,controllersは、usersフォルダの中にcontrollersがたくさん入っている
  #'users/passwords'は、usersがフォルダの名前で、passwordsはコントローラの名前
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
