Rails.application.routes.draw do

  root 'pages#index'

  resources :pages

  resources :students

  resources :sponsors

  resources :volunteers

  # get :student, to: 'pages#student'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/student_videos", to: "student_videos#index"
end
