Rails.application.routes.draw do
  root 'pages#home'
  get 'resume' => 'pages#resume'

  get 'log_in' => 'sessions#new'
  post 'log_in' => 'sessions#create'
  get 'log_out' => 'sessions#destroy'

  patch 'projects/:id/add_tech/:tech_id' => "projects#add_tech"
  delete 'projects/:id/rm_tech/:tech_id' => "projects#rm_tech"

  resources :users, except: :show
  resources :projects, except: :show
  resources :technologies, except: :show
end
