Rails.application.routes.draw do
  root 'pages#index'

  resources :pages

  resources :students do
    member do
      get :confirm_email
    end
  end

  # get :student, to: 'pages#student'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
