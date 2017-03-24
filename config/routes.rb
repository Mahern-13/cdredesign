Rails.application.routes.draw do
  get 'about/index'

  root 'pages#index'



  get 'about/class_content'

  get 'about/curriculum'

  get 'about/meet_the_team'

  get 'about/blog'

  get 'about/in_the_news'

  get 'about/sponsors'

  get 'about/contact_info'

  get 'about/show'


  resources :pages

  resources :students

  resources :sponsors

  resources :volunteers

  # get :student, to: 'pages#student'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/student_videos", to: "student_videos#index"
end

