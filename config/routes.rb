Rails.application.routes.draw do
  # root 'pages#home', via: [:get, :post]
  root to: redirect('v1')

  namespace :v1 do
    root 'pages#home'
    controller :pages do
      get 'resume'
      get 'colors'
      get 'site_color'
    end
    get 'resume' => 'pages#resume'
    get 'colors' => 'pages#colors'
    post 'colors' => 'pages#update_color'
    get 'site_color' => 'pages#site_color'
    resources :projects, except: :show

    # login stuff
    get 'log_in' => 'sessions#new'
    post 'log_in' => 'sessions#create'
    get 'log_out' => 'sessions#destroy'
    patch 'projects/:id/add_tech/:tech_id' => "projects#add_tech"
    delete 'projects/:id/rm_tech/:tech_id' => "projects#rm_tech"

    # technology stuff
    resources :technologies, except: :show
    resources :users, except: :show
  end

  namespace :v2 do
    root 'pages#home'
    resources :projects, except: :show
  end




end
